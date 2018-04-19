Pod::Spec.new do |s|
  s.name         = "ProxyKit-LogsFree"
  s.version      = "1.2.1"
  s.summary      = "SOCKS proxy server and socket client built upon GCDAsyncSocket."
  s.homepage     = "https://github.com/chrisballinger/ProxyKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Chris Ballinger" => "chrisballinger@gmail.com" }
  s.social_media_url   = "https://github.com/chrisballinger"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/RishatShamsutdinov/ProxyKit.git", :tag => s.version.to_s }

  s.default_subspec = 'standard'

  s.subspec 'common' do |ss|
    ss.dependency 'CocoaAsyncSocket', '~> 7.6'
    ss.requires_arc = true
  end

  s.subspec 'common-logs' do |ss|
    ss.dependency 'CocoaLumberjack' # Don't pin version because of 2->3 dependency upgrade nightmare
    ss.requires_arc = true
  end

  s.subspec 'Server-LogsFree' do |ss|
    ss.source_files = 'ProxyKit/Server/*.{h,m}'
    ss.dependency "#{s.name}/common"
    ss.requires_arc = true
  end

  s.subspec 'Server' do |ss|
    ss.dependency "#{s.name}/Server-LogsFree"
    ss.dependency "#{s.name}/common-logs"
    ss.requires_arc = true
  end

  s.subspec 'Client-LogsFree' do |ss|
    ss.source_files = 'ProxyKit/Client/*.{h,m}'
    ss.dependency "#{s.name}/common"
    ss.requires_arc = true
  end

  s.subspec 'Client' do |ss|
    ss.dependency "#{s.name}/Client-LogsFree"
    ss.dependency "#{s.name}/common-logs"
    ss.requires_arc = true
  end

  s.subspec 'standard' do |ss|
    ss.dependency "#{s.name}/Client"
    ss.dependency "#{s.name}/Server"
    ss.requires_arc = true
  end

end
