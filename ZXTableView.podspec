Pod::Spec.new do |s|
s.name         = 'ZXTableView'
s.version      = '1.0.9'
s.summary      = '快速构建TableView'
s.homepage     = 'https://github.com/SmileZXLee/ZXTableView'
s.license      = 'MIT'
s.authors      = {'李兆祥' => '393727164@qq.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/SmileZXLee/ZXTableView.git', :tag => s.version}
s.source_files = 'ZXTableView/**/*'
s.requires_arc = true
end