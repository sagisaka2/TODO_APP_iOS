# Uncomment this line to define a global platform for your project

platform :ios, '11.2'
use_frameworks!

def install_pods
    # Lintツール、Todoアプリの開発には直接影響しないがコードを綺麗にしたいので入れる
    pod 'SwiftLint', '~> 0.24.0'

end

# target list
targetArray= Array['TodoSample']
for targetName in targetArray
    target targetName do
    	install_pods
    end
end
