

Pod::Spec.new do |s|
s.name         = 'XYProgressHUD'
s.version      = '1.0.0'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.homepage     = 'https://github.com/Loveying/XYProgressHUD.git'
s.authors      = { "xiayingying" => "946341964@qq.com" }
s.summary      = 'MBProgressHUD简单封装'

s.platform     =  :ios, '8.0'
s.source       =  {:git => 'https://github.com/Loveying/XYProgressHUD.git', :tag => s.version}
s.source_files = 'XYProgressHUD/XYProgressHUD','XYProgressHUD/XYProgressHUD/XYResource/*'
s.frameworks   =  'UIKit'
s.requires_arc = true

end


