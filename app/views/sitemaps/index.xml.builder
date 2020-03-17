xml.instruct! :xml, version: '1.0', encoding: 'UTF-8'

xml.tag! 'urlset', 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
	xml.tag! 'url' do
		xml.tag! 'loc', root_url
	end
	xml.tag! 'url' do
		xml.tag! 'loc', referencement_url
	end
	xml.tag! 'url' do
		xml.tag! 'loc', creation_site_internet_url
	end
end
