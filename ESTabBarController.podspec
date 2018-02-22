Pod::Spec.new do |s|

    s.name         = "ESTabBarController"
    s.version      = "0.2"
    s.license      = "MIT"
    s.summary      = "Custom tab bar controller for iOS."
    s.homepage     = "https://github.com/ezescaruli/ESTabBarController"
    s.author       = {"Ezequiel Scaruli" => "ezequiel.scaruli@gmail.com"}
    s.source       = {:git => "https://github.com/ezescaruli/ESTabBarController.git", :tag => "0.2"}
    s.source_files = "Source/**/*.{h,m}"
    s.resources    = "Source/**/*.xib"
    s.platform     = :ios, "9.0"
    s.requires_arc = true

end
