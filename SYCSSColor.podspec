

Pod::Spec.new do |spec|
  spec.name         = 'SYCSSColor'
  spec.version      = '0.1.6'
  spec.license      =  { :type => 'MIT',  }
  spec.homepage     = 'https://github.com/wangson1237/SYCSSColor'
  spec.authors      = { 'Wangson1237' => 'wangson1237@outlook.com'}
  spec.summary      = 'Base on CSS color for iOS.'
  spec.source       = { :git => 'https://github.com/wangson1237/SYCSSColor.git', :tag => spec.version.to_s }
  spec.module_name  = 'SYCSSColor'
  spec.header_dir   = 'SYCSSColor'

  spec.ios.deployment_target = '10.0'

  # Subspecs
  spec.subspec 'Core' do |core|
    core.compiler_flags = '-fno-exceptions -Wno-implicit-retain-self'
    core.public_header_files = [
      'Source/*.h'
    ]
    
    core.source_files = [
      'Source/**/*.{h,mm}'
    ]
  end

  # Include these by default for backwards compatibility.
  spec.default_subspecs = 'Core'
  
  spec.frameworks = 'UIKit', 'CoreFoundation', 'CoreGraphics'

  spec.library = 'c++'
  spec.pod_target_xcconfig = {
    'SYANG_CXX_LANGUAGE_STANDARD' => 'c++11',
    'SYANG_CXX_LIBRARY' => 'libc++'
   }
   
end
