Pod::Spec.new do |spec|

  spec.name         = "ZKKit"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of ZKKit."
  spec.homepage     = "https://github.com/kayynlyxy/ZKKit"
  spec.license      = "MIT"
  spec.author             = { "kayynlyxy" => "13051053195@163.com" }
  spec.platform     = :ios
  # spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/kayynlyxy/ZKKit.git", :tag => "#{spec.version}" }
  spec.source_files  = "ZKKit/*"
  spec.requires_arc = true

end
