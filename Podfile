use_frameworks!
platform :ios, '11.0'

target 'Emotions' do 
end

target 'EmotionsTests' do
end

target 'EmotionsUITests' do
  pod 'XCTest-Gherkin'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
        end
    end
end
