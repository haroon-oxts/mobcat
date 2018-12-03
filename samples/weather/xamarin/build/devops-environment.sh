# Script for setting environment variables to aid in local client development

echo ""
echo "========== WeatherSample Environment Configuration started =========="
echo ""

# Resolve parameters
for i in "$@"; do
    case $1 in
        "" ) break ;;
        -k | --api-key ) API_KEY="$2"; shift ;;
        -s | --service-endpoint ) SERVICE_ENDPOINT="$2"; shift ;;
        -a | --android-appcenter-secret ) ANDROID_APP_CENTER_SECRET="$2"; shift ;;
        -i | --ios-appcenter-secret ) iOS_APP_CENTER_SECRET="$2"; shift ;;
        -* | --*) echo "Unknown option: '$1'"; exit 1 ;;
        * ) echo "Unknown argument: '$1'"; exit 1 ;;
    esac
    shift
done

# Verify all parameters have values
if [ -z "$API_KEY" ]
then
    echo "Missing --api-key parameter"
    exit 1
fi

if [ -z "$SERVICE_ENDPOINT" ]
then
    echo "Missing --service-endpoint parameter"
    exit 1
fi

if [ -z "$ANDROID_APP_CENTER_SECRET" ]
then
    echo "Missing --android-appcenter-secret parameter"
    exit 1
fi

if [ -z "$iOS_APP_CENTER_SECRET" ]
then
    echo "Missing --ios-appcenter-secret parameter"
    exit 1
fi

echo "Setting Environement Variables:"

echo "- WeatherServiceApiKey"
##vso[task.setvariable variable=WeatherServiceApiKey;;issecret=true] $API_KEY
echo "Build_WeatherServiceApiKey: $BUILD_WEATHERSERVICEAPIKEY"
echo "WeatherServiceApiKey: $WeatherServiceApiKey"
echo "WEATHERSERVICEAPIKEY: $WEATHERSERVICEAPIKEY"

echo "- WeatherServiceUrl"
##vso[task.setvariable variable=WeatherServiceUrl;;issecret=false] $SERVICE_ENDPOINT
echo "Build_WeatherServiceUrl: $BUILD_WEATHERSERVICEURL"
echo "WeatherServiceUrl: $WeatherServiceUrl""
echo "WEATHERSERVICEURL: $WEATHERSERVICEURL"

echo "- AndroidAppCenterSecret"
##vso[task.setvariable variable=AndroidAppCenterSecret;;issecret=true] $ANDROID_APP_CENTER_SECRET
echo "Build_AndroidAppCenterSecret: $BUILD_ANDROIDAPPCENTERSECRET"
echo "AndroidAppCenterSecret: $AndroidAppCenterSecret"
echo "ANDROIDAPPCENTERSECRET: $ANDROIDAPPCENTERSECRET"

echo "- iOSAppCenterSecret"
##vso[task.setvariable variable=iOSAppCenterSecret;;issecret=true] $iOS_APP_CENTER_SECRET
echo "Build_iOSAppCenterSecret: $BUILD_IOSAPPCENTERSECRET"
echo "iOSAppCenterSecret: $iOSAppCenterSecret"
echo "IOSAPPCENTERSECRET: $IOSAPPCENTERSECRET"

echo ""
echo "========= WeatherSample Environment Configuration completed ========="
echo ""