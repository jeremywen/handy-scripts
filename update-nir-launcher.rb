require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'zip/zip'

def unzip_file (file, destination)
  Zip::ZipFile.open(file, Zip::ZipFile::CREATE) { |zip_file|
   zip_file.each { |f|
     f_path=File.join(destination, f.name)
     FileUtils.mkdir_p(File.dirname(f_path))
     zip_file.extract(f, f_path) unless File.exist?(f_path)
   }
  }
end

[
  'http://launcher.nirsoft.net/download.html'
].each { |pagepath|
  doc = Nokogiri::HTML(open(pagepath))
  doc.xpath('//p/a').each do |link|
    linkpath = link['href']  
    if linkpath.start_with?('http://download.nirsoft.net/nirsoft') 
      filename = linkpath.split('/')[-1]  
      puts linkpath + ' filename ' + filename
  
      resp = Net::HTTP.get_response(URI.parse(linkpath))
      open(filename, 'wb') { |file|
        file.write(resp.body)
      }
      unzip_file(filename, "C:/code/tools/nirsoft_package")
  end  
end
}

