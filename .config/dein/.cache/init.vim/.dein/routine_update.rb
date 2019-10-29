require 'open-uri'
require 'rest-client'
require 'json'
require 'pry'

tags_urls = File.read("tags_urls.txt").split.map {|i| i.gsub('"','') }
new_version_avail = false

result = []
provider_updated = []
tags_urls.each do |tags_url|
	tags = JSON.parse(RestClient.get("#{tags_url}?access_token=#{ENV['GITHUB_TOKEN']}"))
	if not tags.empty?
		#tags.each do |tag|
		#	version = tag["name"]
		#	provider = tag["zipball_url"].split("/")[5].match(/terraform-provider-(.*)/)[1]
		#	puts version.match("[vV](.*)")[1]
		#end
		version = tags[0]["name"]
		provider = tags[0]["zipball_url"].split("/")[5].match(/terraform-provider-(.*)/)[1]
		if not File.exist? "./schemas-extractor/schemas/#{provider}-#{version.match("[vV](.*)")[1]}.json" and provider != "azure-classic"
			provider_updated.push provider
			`echo terraform-provider-#{provider} > schemas-extractor/providers.list.full`
			`echo #{provider} > schemas-extractor/providers.list`
			`cd schemas-extractor && ./build-version.sh #{version.match("[vV](.*)")[1]}`
			new_version_avail = true
		else
			puts "No new version for #{provider}, latest: #{version}"
		end
	end
	
end

if new_version_avail 
	`ruby version_dissect.rb`
	`ruby update_versions.rb > .tfcompleterc`
	`ruby update_provider_md.rb > PROVIDER_VERSOINS.md`
	`git add provider_json`
	`git add PROVIDER_VERSOINS.md`
	`git add .tfcompleterc`
	`git commit -m "[Bot] Automatic Provider Update: #{provider_updated}"`
	`git push`
end
