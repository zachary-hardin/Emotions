platform :ios, '11.0'

target 'Emotions' do
  use_frameworks!
  pod 'RealmSwift'

  target 'EmotionsTests' do
    inherit! :search_paths
  end
    
  target 'EmotionsUITests' do
    inherit! :search_paths
    pod 'XCTest-Gherkin'
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
        end
    end
end
