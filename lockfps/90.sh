#!/system/bin/sh
# Fungsi untuk memeriksa UID
check_uid() {
    CURRENT_UID=$(id -u) # Mendapatkan UID dari proses saat ini
    REQUIRED_UID=0    # UID target untuk 'shell'

    if [ "$CURRENT_UID" -ne "$REQUIRED_UID" ]; then
        echo "@modulegaming6969fps: Menjalankan tanpa izin root."
        return 1
    else
        echo "Proses dijalankan sebagai UID $REQUIRED_UID."
        return 0
    fi
}
check_uid
# Menampilkan UID, PID, dan USER_ID di akhir
echo "UID: $(id -u)"
echo "PID: $$"
echo "USER_ID: ${USER_ID:-Not set}"  # Menampilkan USER_ID atau 'Not set' jika tidak ada
# Tampilkan logo kucing
echo "      |\\___/|         [Modul Majes]"
echo "     (= o.o =)__   [@modulegaming6969fps]"
echo "      \\_^_\\   )   [Membership Kek Bang]"
echo "         ||--||     [Module Perbulan Di YT & Permanen Tele]"
echo "@modulegaming6969fps"
echo "https://t.me/modulegimang6969fps"
echo "https://www.youtube.com/@modulegaming6969fps"
echo "https://www.youtube.com/channel/UCp3d_0F3VISlkarGJyflXFQ/join"
# Fungsi untuk memeriksa perintah yang tersedia
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Deteksi perangkat
settings put global device_name "Samsung Galaxy S25 Ultra" > /dev/null 2>&1 
settings put system about_name "Samsung Galaxy S25 Ultra" > /dev/null 2>&1 
settings put secure oppo_device_name "Samsung Galaxy S25 Ultra" > /dev/null 2>&1 
settings put global vivo_device_name "Samsung Galaxy S25 Ultra" > /dev/null 2>&1 
settings put global tran_device_name "Samsung Galaxy S25 Ultra" > /dev/null 2>&1 
settings put global tran_device_name_default "Samsung Galaxy S25 Ultra" > /dev/null 2>&1
settings put system tran_device_name "Samsung Galaxy S25 Ultra" > /dev/null 2>&1 
settings put system tran_device_name_default "Samsung Galaxy S25 Ultra" > /dev/null 2>&1
setprop debug.gralloc.gfx_ubwc_disable 0 > /dev/null 2>&1 
setprop debug.graphics.game_default_frame_rate.disabled 0 > /dev/null 2>&1 
setprop persist.sys.tran.device.name "Samsung Galaxy S25 Ultra" > /dev/null 2>&1 
setprop persist.sys.devicename "Samsung Galaxy S25 Ultra" > /dev/null 2>&1 
setprop persist.sys.device_name "Samsung Galaxy S25 Ultra" > /dev/null 2>&1 
tran_device_name=$(getprop persist.sys.tran.device.name)
device_name=$(getprop persist.sys.devicename)
device_name_2=$(getprop persist.sys.devicename)
# Menampilkan hasil deteksi
echo "Tran Nama Device: $tran_device_name"
echo "Nama Device: $device_name"
echo "Nama Device Again: $device_name_2"


# Deteksi OS dan versi
os_version=$(getprop ro.build.version.release)
android_sdk=$(getprop ro.build.version.sdk)
echo "OS: Android $os_version (SDK $android_sdk)"

# Deteksi RAM (dalam MB)
total_ram=$(grep MemTotal /proc/meminfo | awk '{print $2 / 1024 " MB"}')
available_ram=$(grep MemAvailable /proc/meminfo | awk '{print $2 / 1024 " MB"}')
echo "RAM Total: $total_ram"
echo "RAM Tersedia: $available_ram"

# Deteksi Brand & Manufacturer
build_brand=$(getprop Build.BRAND)
cpu_manufacturer=$(getprop ro.soc.manufacturer)
cpu_vendor_manufacturer=$(getprop ro.vendor.soc.manufacturer)
hardware_soc_manufacturer=$(getprop ro.hardware.soc.manufacturer)
# Output hasil
echo "Brand: $build_brand"
echo "Manufacturer: $cpu_manufacturer $cpu_vendor_manufacturer $hardware_soc_manufacturer"

# Deteksi chipset (SoC)
chipset_qti_name=$(getprop ro.vendor.qti.soc_name)
chipset_mtk_name=$(getprop ro.vendor.soc.model.external_name)
chipset_mtk_name2=$(getprop ro.vendor.soc.model.part_name)
cpu_chipname=$(getprop ro.chipname)
cpu_hardware_chipname=$(getprop ro.hardware.chipname)
echo "Soc Name: $chipset_qti_name $chipset_mtk_name $chipset_mtk_name2 $cpu_chipname $cpu_hardware_chipname"

# Deteksi CPU
cpu_cores=$(grep -c ^processor /proc/cpuinfo)
cpu_model_universal=$(getprop ro.soc.model)
cpu_model_mtk=$(getprop ro.vendor.soc.model)
cpu_model_qti=$(getprop ro.vendor.qti.soc_model)
cpu_model_oppo=$(getprop ro.product.oplus.cpuinfo)
echo "Soc Model: $cpu_model_universal $cpu_model_mtk $cpu_model_qti $cpu_model_oppo"    

gpu_renderer=$(dumpsys SurfaceFlinger 2>/dev/null | grep -i 'GLES' | awk -F': ' '{print $2}')
if [ -z "$gpu_renderer" ]; then
    gpu_renderer=$(cat /proc/driver/gpu/render | grep -i 'renderer' | awk -F': ' '{print $2}')
fi

if [ -n "$gpu_renderer" ]; then
    echo "GPU: $gpu_renderer"
else
    echo "GPU tidak terdeteksi."
fi

# OpenGLES version
#65536
#65535
#131072
#196608
#196609
#196610
#197632
#196628
#198656
#327680
#393216
#458752
#524288
#589824

versi_opengles=$(getprop ro.opengles.version)

if [ -z "$versi_opengles" ]; then
    echo "Tidak dapat mendeteksi versi OpenGL ES."
else
    case "$versi_opengles" in
        65536) version_name="OpenGL ES-CM 1.0" ;;
        65535) version_name="OpenGL ES-CM 1.1" ;;
        131072) version_name="OpenGL ES 2.0" ;;
        196608) version_name="OpenGL ES 3.0" ;;
        196609) version_name="OpenGL ES 3.1" ;;
        196610) version_name="OpenGL ES 3.1" ;;
        196628) version_name="OpenGL ES 3.2" ;;
        197632) version_name="OpenGL ES 3.2" ;;
        198656) version_name="OpenGL ES 3.2" ;;
        327680) version_name="OpenGL ES 5.0" ;;
        393216) version_name="OpenGL ES 6.0" ;;
        458752) version_name="OpenGL ES 7.0" ;;
        524288) version_name="OpenGL ES 8.0" ;;
        589824) version_name="OpenGL ES 9.0" ;;
        0) version_name="OpenGL ES tidak tersedia" ;;
        *) version_name="Versi OpenGL ES tidak dikenali" ;;
    esac
    echo "Versi OpenGL ES: $version_name ($versi_opengles)"
fi

# Deteksi penyimpanan
total_storage=$(df -h /data | awk 'NR==2 {print $2}')
available_storage=$(df -h /data | awk 'NR==2 {print $4}')
echo "Penyimpanan Total: $total_storage"
echo "Penyimpanan Tersedia: $available_storage"

# Deteksi baterai
battery_level=$(dumpsys battery | grep level | awk '{print $2 "%"}')
battery_status=$(dumpsys battery | grep status | awk '{print $2}')
case $battery_status in
    1) status="Unknown" ;;
    2) status="Charging" ;;
    3) status="Discharging" ;;
    4) status="Not Charging" ;;
    5) status="Full" ;;
    *) status="Unknown" ;;
esac
echo "Baterai: $battery_level ($status)"

# Deteksi sensor
sensor_count=$(getprop ro.hardware.sensors | tr ',' '\n' | wc -l)
echo "Jumlah Sensor: $sensor_count"

# Deteksi resolusi layar
if command_exists wm; then
    resolution=$(wm size | awk '{print $3}')
else
    resolution=$(dumpsys display | grep "mBaseDisplayInfo" | awk -F' ' '{print $3}')
fi
echo "Resolusi Layar: $resolution"

# Fungsi untuk memeriksa apakah sebuah perintah ada
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Inisialisasi variabel untuk densitas layar
density=""
lcd_density=""

# Deteksi densitas layar menggunakan wm atau dumpsys
if command_exists wm; then
    density=$(wm density | awk '{print $2 " dpi"}')
elif command_exists dumpsys; then
    density=$(dumpsys display | grep "mBaseDisplayInfo" | awk -F'=' '{print $2}' | awk '{print $1 " dpi"}')
else
    echo "Perintah untuk mendeteksi densitas layar tidak ditemukan."
    exit 1
fi

# Deteksi ro.sf.lcd_density
lcd_density=$(getprop ro.sf.lcd_density)

# Cek apakah lcd_density berhasil didapat
if [ -z "$lcd_density" ]; then
    echo "Tidak dapat mendeteksi nilai ro.sf.lcd_density."
else
    echo "LCD Density (ro.sf.lcd_density): ${lcd_density} dpi"
fi

# Output densitas layar yang dideteksi
if [ -n "$density" ]; then
    echo "Densitas Layar: $density"
else
    echo "Densitas layar tidak dapat dideteksi."
fi

# Deteksi versi kernel
kernel_version=$(uname -r)
echo "Versi Kernel: $kernel_version"

# Deteksi uptime
uptime=$(cat /proc/uptime | awk '{print int($1/3600) " jam " int(($1%3600)/60) " menit"}')
echo "Uptime: $uptime"

# Deteksi Virtual RAM (Swap)
total_swap=$(grep SwapTotal /proc/meminfo | awk '{print $2 / 1024 " MB"}')
free_swap=$(grep SwapFree /proc/meminfo | awk '{print $2 / 1024 " MB"}')

echo "Virtual RAM (Swap) Total: $total_swap"
echo "Virtual RAM (Swap) Bebas: $free_swap"

echo "╔═╦╗╔╦╗╔═╦═╦╦╦╦╗╔═╗"
echo "║╚╣║║║╚╣╚╣╔╣╔╣║╚╣═╣"
echo "╠╗║╚╝║║╠╗║╚╣║║║║║═╣"
echo "╚═╩══╩═╩═╩═╩╝╚╩═╩═╝"

echo
echo "Informasi perangkat di atas dikumpulkan menggunakan shell script."
echo "Untuk informasi lebih lanjut, kunjungi Youtube @modulegaming6969fps"
{
# Parse --uid option
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --uid)
            USER_ID=$2
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

# Detect the default user ID if --uid is not provided
if [ -z "$USER_ID" ]; then
    USER_ID=$(cmd user list | grep 'default' | cut -f 2 -d ' ')
    # If default user is not found, fall back to user 0
    USER_ID=${USER_ID:-0}
fi

# Output the detected or provided USER_ID
echo "User ID: $USER_ID"

# Initialize arrays for successful and failed apps
SUCCESS_APPS=()
FAILED_APPS=()

# Function to log details of each tweak and send notifications
log_tweak_result() {
    local app="$1"
    local tweak_name="$2"
    local result="$3"

    if [[ "$result" -eq 0 ]]; then
        echo "Success: $tweak_name applied to $app"
        cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' "Successfully applied $tweak_name to $app." > /dev/null 2>&1
        am start -a android.intent.action.MAIN -e toasttext "Berhasil Menjalankan Game Manager" -n bellavita.toast/.MainActivity > /dev/null 2>&1
        else
        echo "Failed: $tweak_name could not be applied to $app"
        cmd notification post -S bigtext -t '⚠️ @modulegaming6969fps' 'Tag' "Failed to apply $tweak_name to $app." > /dev/null 2>&1
        am start -a android.intent.action.MAIN -e toasttext "Gagal Menjalankan Game Manager" -n bellavita.toast/.MainActivity > /dev/null 2>&1
    fi
}

for app in $(cmd package list packages -3 | cut -f 2 -d ":"); do
    if [[ "$app" != "me.piebridge.brevent" && "$app" != "com.draco.ladb" && "$app" != "com.ddm.qute" && "$app" != "com.levv.gametuner" && "$app" != "com.levv.magictweak" ]]; then
        echo "Applying tweaks to $app..."
        # Initialize success flag
        all_success=true
        
        # Tweak Downscale
        cmd game downscale disable "$app" > /dev/null 2>&1
        cmd game upscale disable "$app" > /dev/null 2>&1
        cmd game list-modes "$app" > /dev/null 2>&1
        if [[ $? -ne 0 ]]; then
            #Tweak Cadangan
            cmd device_config put game_overlay "$app" mode=2,fps=90,useAngle=true,scaling=disable,downscale=disable,downscaleFactor=disable,resolutionScaling=disable,upscale=disable,upscaleFactor=disable:mode=3,fps=90,useAngle=false,scaling=disable,downscale=disable,downscaleFactor=disable,resolutionScaling=disable,upscale=disable,upscaleFactor=disable > /dev/null 2>&1
            cmd game list-config "$app" > /dev/null 2>&1
            cmd game list-modes "$app" > /dev/null 2>&1
            log_tweak_result "$app" "cmd device_config sebagai cadangan" $?
        else
            log_tweak_result "$app" "cmd game downscale" 0
        fi
        
        # Tweak Downscale & fps
        cmd game set --mode 2 --fps 90 --downscale disable --upscale disable --user 2000 "$app"; cmd game set --mode 3 --fps 90 --downscale disable --user 2000 "$app" > /dev/null 2>&1
        cmd game list-modes "$app" > /dev/null 2>&1
        if [[ $? -ne 0 ]]; then
            #Tweak Cadangan
            cmd device_config put game_overlay "$app" mode=2,fps=90,useAngle=true,scaling=disable,downscale=disable,downscaleFactor=disable,resolutionScaling=disable,upscale=disable,upscaleFactor=disable:mode=3,fps=90,useAngle=false,scaling=disable,downscale=disable,downscaleFactor=disable,resolutionScaling=disable,upscale=disable,upscaleFactor=disable > /dev/null 2>&1
            cmd game list-modes "$app" > /dev/null 2>&1
            log_tweak_result "$app" "cmd device_config sebagai cadangan" $?
        else
            log_tweak_result "$app" "cmd game set mode performance" 0
        fi
        
        # Tweak Downscale & fps
        cmd game set --mode 2 --fps 90 --downscale disable --upscale disable --user $USER_ID "$app"; cmd game set --mode 3 --fps 90 --downscale disable --user $USER_ID "$app" > /dev/null 2>&1
        cmd game list-modes "$app" > /dev/null 2>&1
        if [[ $? -ne 0 ]]; then
            #Tweak Cadangan
            cmd device_config put game_overlay "$app" mode=2,fps=90,useAngle=true,scaling=disable,downscale=disable,downscaleFactor=disable,resolutionScaling=disable,upscale=disable,upscaleFactor=disable:mode=3,fps=90,useAngle=false,scaling=disable,downscale=disable,downscaleFactor=disable,resolutionScaling=disable,upscale=disable,upscaleFactor=disable > /dev/null 2>&1
            cmd game list-modes "$app" > /dev/null 2>&1
            log_tweak_result "$app" "cmd device_config sebagai cadangan" $?
        else
            log_tweak_result "$app" "cmd game set mode 2" 0
        fi
        
        # Tweak Performance
        cmd game mode performance "$app" > /dev/null 2>&1
        cmd game list-modes "$app" > /dev/null 2>&1
        if [[ $? -ne 0 ]]; then
            # Tweak Cadangan 1
            cmd game mode 2 "$app" > /dev/null 2>&1
            cmd game list-modes "$app" > /dev/null 2>&1
            if [[ $? -ne 0 ]]; then
                # Tweak Cadangan 2
                cmd game list-config "$app" > /dev/null 2>&1
                cmd game list-modes "$app" > /dev/null 2>&1
                if [[ $? -ne 0 ]]; then
                    # Tweak Cadangan 3
                    cmd game set --mode 2 "$app" > /dev/null 2>&1
                    cmd game list-modes "$app" > /dev/null 2>&1
                    if [[ $? -ne 0 ]]; then
                        # Tweak Cadangan 4
                        cmd game set --mode 2 --user $USER_ID "$app" > /dev/null 2>&1
                        cmd game list-modes "$app" > /dev/null 2>&1
                        log_tweak_result "$app" "cmd game set --mode 2 --user $USER_ID sebagai cadangan keempat" $?
                    else
                        log_tweak_result "$app" "cmd game set --mode 2 sebagai cadangan ketiga" 0
                    fi
                else
                    log_tweak_result "$app" "cmd game set --mode 2 --user 0 sebagai cadangan kedua" 0
                fi
            else
                log_tweak_result "$app" "cmd game mode 2 sebagai cadangan pertama" 0
            fi
        else
            log_tweak_result "$app" "cmd game mode performance" 0
        fi
        
        cmd device_config get game_overlay "$app"
        cmd game list-modes "$app" > /dev/null 2>&1
        log_tweak_result "$app" "Get (periksa) Game overlay mode and FPS" $?

        # Check for any failed tweak
        if [[ $? -ne 0 ]]; then
            all_success=false
        fi

        # Record app success or failure
        if $all_success; then
            echo "All tweaks successfully applied to $app"
            SUCCESS_APPS+=("$app")
        else
            echo "Some tweaks failed for $app"
            FAILED_APPS+=("$app")
        fi
    fi
done
# Summary of tweaks
if [ ${#SUCCESS_APPS[@]} -gt 0 ]; then
    echo "Successfully applied tweaks to the following apps:"
    for app in "${SUCCESS_APPS[@]}"; do
        echo "- $app"
        cmd notification post -S bigtext -t '✅ @modulegaming6969fps' 'Tag' "Successfully applied all tweaks to $app." > /dev/null 2>&1
        am start -a android.intent.action.MAIN -e toasttext "Berhasil Menjalankan Game Manager" -n bellavita.toast/.MainActivity > /dev/null 2>&1
    done
fi

if [ ${#FAILED_APPS[@]} -gt 0 ]; then
    echo "Failed to fully apply tweaks to the following apps:"
    for app in "${FAILED_APPS[@]}"; do
        echo "- $app"
        cmd notification post -S bigtext -t '❌ @modulegaming6969fps' 'Tag' "Failed to fully apply tweaks to $app." > /dev/null 2>&1
        am start -a android.intent.action.MAIN -e toasttext "Gagal Menjalankan Game Manager" -n bellavita.toast/.MainActivity > /dev/null 2>&1
    done
fi
} > /dev/null 2>&1
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Memasang Tweak Settings Put System.' > /dev/null 2>&1
system_settings=(
  "fstb_target_fps_margin_high_fps 10"
  "fstb_target_fps_margin_low_fps 15"
  "gcc_fps_margin 5"
  "frame_override_support 0"
  "game_default_frame_rate_override 90"
  "enable_frame_rate_override 1"
  "virtual_display_default_refresh_rate 90"
  "force_max_refresh_rate 90"
  "override_min_frame_rate 90"
  "use_content_detection_for_refresh_rate 0"
  "default_fps 90"
  "disable_idle_fps 1"
  "fps.limit.is.now locked"
  "aod_monitor_default_fps 90"
  "fod_monitor_default_fps 90"
  "app_switch_fps 90"
  "low_power_fps 90"
  "gaming_mode_fps 90"
  "battery_saving_mode_fps 90"
  "idle_reduce_framerate_enable no"
  "idle_default_fps 90"
  "enable_dpps_dynamic_fps 0"
  "enable_perf_hint_for_low_fps 1"
  "low_framerate_limit 90"
  "refresh_rate 90"
  "default_refresh_rate 90"
  "last_tran_refresh_mode_in_refresh_setting 90"
  "min_refresh_rate 90"
  "max_refresh_rate 90"
  "refresh_default_rate 90"
  "thermal_limit_refresh_rate 90"
  "user_refresh_rate 90"
  "peak_refresh_rate 90"
  "pointer_speed 7"
  "power_save_refresh_rate 90"
  "tran_settings_long_battery_swith_60hz 0"
  "tran_settings_long_battery_swith_90hz 0"
  "tran_settings_long_battery_swith_120hz 0"
  "tran_settings_long_battery_swith_144hz 0"
  "tran_device_name Samsung Galaxy S25 Ultra"
  "tran_device_name_default Samsung Galaxy S25 Ultra"
  "tran_max_cached_processes 0"
  "tran_default_auto_refresh_support 0"
  "tran_low_battery_60hz_refresh_rate_support 0"
  "tran_low_battery_90hz_refresh_rate_support 1"
  "tran_low_battery_120hz_refresh_rate_support 1"
  "tran_low_battery_144hz_refresh_rate_support 1"
  "tran_90hz_refresh_rate_not_support 1"
  "tran_120hz_refresh_rate_not_support 0"
  "tran_144hz_refresh_rate_not_support 0"
  "tran_60hz_refresh_rate_not_support 1"
  "tran_refresh_rate_support 1"
  "tran_refresh_rate_video_detector_support 1"
  "tran_need_recovery_refresh_mode 90"
  "transsion_refresh_rate_support 1"
  "transsion_frame_override_support 0"
  "tran_refresh_mode 90"
  "display_refresh_rate 90"
  "90hz_refresh_rate_not_support 1"
  "refresh_rate_video_detector_support 1"
  "default_auto_refresh_support 0"
  "power_saving_fps_limit 90"
  "miui_home_animation_rate 3"
  "adaptive_refresh_rate 0"
  "aod_monitor_default_fps 90"
  "enforce_refresh_rate 90"
  "game_max_fps 90"
  "game_min_fps 90"
  "gaming_mode_fps 90"
  "input_refresh_rate 90"
  "input_sampling_rate 90"
  "low_framerate_limit 90"
  "refresh_rate 90"
  "refresh_rate_adaptive 0"
  "refresh_rate_limit 90"
  "refresh_rate_locked 1"
  "table_framerate 90"
  "touch_sampling_rate 90"
  "touch_response_rate 1"
  "touch_sampling_rate 90"
  "touch_sampling_rate_override 0"
  "game_driver_fps_limit 90"
  "game_driver_frame_skip_enable 0"
  "game_driver_gpu_mode 1"
  "game_driver_max_frame_rate 90"
  "game_driver_min_frame_rate 90"
  "game_driver_power_saving_mode 0"
  "game_driver_vsync_enable 1"
  "gaming_mode_fps 90"
  "high_fps_mode 4"
  "minimum_refresh_rate 90"
  "sem_power_mode_refresh_rate 0,0,-1,0,2"
  "sem_power_mode_refresh_rate_cover 0,0,-1,0,2"
  "vendor_display_refresh_rate 90"
  "fps_current_limit 90"
  "NV_FPSLIMIT 90"
  "high_frame_rate_sf_set_big_core_fps_threshold 0"
  "frame_rate_multiple_threshold 0"
  "scroll_boost_refreshrate 90"
  "touch_boost_refreshrate 90"
  "user_screen_refresh_rate 90"
  "game_scene_more_fps 90"
  "miui_refresh_rate 90"
  "maximum_refresh_rate 90"
  "SpeedControlPara ver_num=3;enable=false;thermal=99;limit_level=90,90,90,90;limit_level_up=90,90,90,90;prohibittimer=7200"
  "power_save_pre_refresh_state 90"
  "RUS_DDS_SWITCH_FEATURE_DAILY_LIMIT_RATE 0.95"
  "RUS_DDS_SWITCH_FEATURE_MONTH_LIMIT_RATE 0.95"
  "db_screen_rate 3"
  "is_smart_fps 0"
)
for setting in "${system_settings[@]}"; do
  settings put system $setting > /dev/null 2>&1
done
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Selesai MemasangTweak Settings Put System.' > /dev/null 2>&1
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Memasang Tweak Settings Put Secure.' > /dev/null 2>&1
secure_settings=(
  "miui_refresh_rate 90"
  "support_highfps 1"
  "user_refresh_rate 90"
  "refresh_rate_mode 3"
  "user_frame_rate_adjustment 1"
  "frame_drop_tolerance 3"
)
for setting in "${secure_settings[@]}"; do
  settings put secure $setting > /dev/null 2>&1
done
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Selesai Memasang Tweak Settings Put Secure.' > /dev/null 2>&1
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Memasang Tweak Settings Put Global.' > /dev/null 2>&1
global_settings=(
  "low_power_fps 90"
  "tran_low_battery_60hz_refresh_rate_support 0"
  "tran_low_battery_90hz_refresh_rate_support 1"
  "tran_low_battery_120hz_refresh_rate_support 1"
  "tran_low_battery_144hz_refresh_rate_support 1"
  "tran_90hz_refresh_rate_not_support 1"
  "tran_120hz_refresh_rate_not_support 0"
  "tran_144hz_refresh_rate_not_support 0"
  "tran_60hz_refresh_rate_not_support 1"
  "tran_settings_long_battery_swith_60hz 0"
  "tran_settings_long_battery_swith_144hz 0"
  "tran_settings_long_battery_swith_120hz 0"
  "tran_settings_long_battery_swith_90hz 0"
  "tran_default_auto_refresh_support 0"
  "tran_refresh_rate_support 1"
  "tran_refresh_rate_video_detector_support 1"
  "tran_need_recovery_refresh_mode 90"
  "preferred_display_refresh_rate 90"
  "refresh_rate 90"
  "dynamic_fps_control 0"
  "dynamic_frame_management 0"
  "dynamic_frame_rate 0"
  "dynamic_refresh_rate_control 0"
  "dont_lower_fps 1"
  "display_refresh_rate_override 0"
  "vivo_screen_refresh_rate_mode 90"
  "FPSTUNER_SWITCH false"
  "ScreenRefreshRateController_resultFps 90"
  "double_frame_flag 0"
  "drop_frame_flag 0"
  "oneplus_screen_refresh_rate 3"
  "screen_refresh_rate 3"
)
for setting in "${global_settings[@]}"; do
  settings put global $setting > /dev/null 2>&1
done
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Selesa Memasangi Tweak Settings Put Global.' > /dev/null 2>&1
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Memasang Tweak Settings Cadangan.' > /dev/null 2>&1
settings_put() {
settings put system fstb_target_fps_margin_high_fps 10
settings put system fstb_target_fps_margin_low_fps 15
settings put system gcc_fps_margin 5
settings put system frame_override_support 0
settings put system game_default_frame_rate_override 90
settings put system enable_frame_rate_override 1
settings put system virtual_display_default_refresh_rate 90
settings put system force_max_refresh_rate 90
settings put system override_min_frame_rate 90
settings put system use_content_detection_for_refresh_rate 0
settings put system default_fps 90
settings put system disable_idle_fps 1
settings put system fps.limit.is.now locked
settings put system aod_monitor_default_fps 90
settings put system fod_monitor_default_fps 90
settings put system app_switch_fps 90
settings put system low_power_fps 90
settings put system gaming_mode_fps 90
settings put system battery_saving_mode_fps 90
settings put system idle_reduce_framerate_enable no
settings put system idle_default_fps 90
settings put system enable_dpps_dynamic_fps 0
settings put system enable_perf_hint_for_low_fps 1
settings put system low_framerate_limit 90
settings put system refresh_rate 90
settings put system default_refresh_rate 90
settings put system last_tran_refresh_mode_in_refresh_setting 90
settings put system min_refresh_rate 90
settings put system max_refresh_rate 90
settings put system refresh_default_rate 90
settings put system thermal_limit_refresh_rate 90
settings put system user_refresh_rate 90
settings put system peak_refresh_rate 90
settings put system pointer_speed 7
settings put system power_save_refresh_rate 90
settings put system tran_settings_long_battery_swith_60hz 0
settings put system tran_settings_long_battery_swith_90hz 0
settings put system tran_settings_long_battery_swith_120hz 0
settings put system tran_settings_long_battery_swith_144hz 0
settings put system tran_device_name Samsung Galaxy S25 Ultra
settings put system tran_device_name_default Samsung Galaxy S25 Ultra
settings put system tran_max_cached_processes 0
settings put system tran_default_auto_refresh_support 0
settings put system tran_low_battery_60hz_refresh_rate_support 0
settings put system tran_low_battery_90hz_refresh_rate_support 1
settings put system tran_low_battery_120hz_refresh_rate_support 1
settings put system tran_low_battery_144hz_refresh_rate_support 1
settings put system tran_90hz_refresh_rate_not_support 1
settings put system tran_120hz_refresh_rate_not_support 0
settings put system tran_144hz_refresh_rate_not_support 0
settings put system tran_60hz_refresh_rate_not_support 1
settings put system tran_refresh_rate_support 1
settings put system tran_refresh_rate_video_detector_support 1
settings put system tran_need_recovery_refresh_mode 90
settings put system transsion_refresh_rate_support 1
settings put system transsion_frame_override_support 0
settings put system tran_refresh_mode 90
settings put system display_refresh_rate 90
settings put system 90hz_refresh_rate_not_support 1
settings put system refresh_rate_video_detector_support 1
settings put system default_auto_refresh_support 0
settings put system power_saving_fps_limit 90
settings put system miui_home_animation_rate 3
settings put system adaptive_refresh_rate 0
settings put system aod_monitor_default_fps 90
settings put system enforce_refresh_rate 90
settings put system game_max_fps 90
settings put system game_min_fps 90
settings put system gaming_mode_fps 90
settings put system input_refresh_rate 90
settings put system input_sampling_rate 90
settings put system low_framerate_limit 90
settings put system refresh_rate 90
settings put system refresh_rate_adaptive 0
settings put system refresh_rate_limit 90
settings put system refresh_rate_locked 1
settings put system table_framerate 90
settings put system touch_sampling_rate 90
settings put system touch_response_rate 1
settings put system touch_sampling_rate 90
settings put system touch_sampling_rate_override 0
settings put system game_driver_fps_limit 90
settings put system game_driver_frame_skip_enable 0
settings put system game_driver_gpu_mode 1
settings put system game_driver_max_frame_rate 90
settings put system game_driver_min_frame_rate 90
settings put system game_driver_power_saving_mode 0
settings put system game_driver_vsync_enable 1
settings put system gaming_mode_fps 90
settings put system high_fps_mode 4
settings put system minimum_refresh_rate 90
settings put system sem_power_mode_refresh_rate 0,0,-1,0,2
settings put system sem_power_mode_refresh_rate_cover 0,0,-1,0,2
settings put system vendor_display_refresh_rate 90
settings put system fps_current_limit 90
settings put system NV_FPSLIMIT 90
settings put system high_frame_rate_sf_set_big_core_fps_threshold 0
settings put system frame_rate_multiple_threshold 0
settings put system scroll_boost_refreshrate 90
settings put system touch_boost_refreshrate 90
settings put system user_screen_refresh_rate 90
settings put system game_scene_more_fps 90
settings put system miui_refresh_rate 90
settings put system maximum_refresh_rate 90
settings put system SpeedControlPara ver_num=3;enable=false;thermal=99;limit_level=90,90,90,90;limit_level_up=90,90,90,90;prohibittimer=7200
settings put system power_save_pre_refresh_state 90
settings put system RUS_DDS_SWITCH_FEATURE_DAILY_LIMIT_RATE 0.95
settings put system RUS_DDS_SWITCH_FEATURE_MONTH_LIMIT_RATE 0.95
settings put system db_screen_rate 3
settings put system is_smart_fps 0
settings put secure miui_refresh_rate 90
settings put secure support_highfps 1
settings put secure user_refresh_rate 90
settings put secure refresh_rate_mode 3
settings put secure user_frame_rate_adjustment 1
settings put secure frame_drop_tolerance 3
settings put global low_power_fps 90
settings put global tran_low_battery_60hz_refresh_rate_support 0
settings put global tran_low_battery_90hz_refresh_rate_support 1
settings put global tran_low_battery_120hz_refresh_rate_support 1
settings put global tran_low_battery_144hz_refresh_rate_support 1
settings put global tran_90hz_refresh_rate_not_support 1
settings put global tran_120hz_refresh_rate_not_support 0
settings put global tran_144hz_refresh_rate_not_support 0
settings put global tran_60hz_refresh_rate_not_support 1
settings put global tran_settings_long_battery_swith_60hz 0
settings put global tran_settings_long_battery_swith_90hz 0
settings put global tran_settings_long_battery_swith_120hz 0
settings put global tran_settings_long_battery_swith_144hz 0
settings put global tran_default_auto_refresh_support 0
settings put global tran_refresh_rate_support 1
settings put global tran_refresh_rate_video_detector_support 1
settings put global tran_need_recovery_refresh_mode 90
settings put global preferred_display_refresh_rate 90
settings put global refresh_rate 90
settings put global dynamic_fps_control 0
settings put global dynamic_frame_management 0
settings put global dynamic_frame_rate 0
settings put global dynamic_refresh_rate_control 0
settings put global dont_lower_fps 1
settings put global display_refresh_rate_override 0
settings put global vivo_screen_refresh_rate_mode 90
settings put global FPSTUNER_SWITCH false
settings put global ScreenRefreshRateController_resultFps 90
settings put global double_frame_flag 0
settings put global drop_frame_flag 0
settings put global oneplus_screen_refresh_rate 3
settings put global screen_refresh_rate 3

}
settings_put > /dev/null 2>&1 
{
settings put system fstb_target_fps_margin_high_fps 10
settings put system fstb_target_fps_margin_low_fps 15
settings put system gcc_fps_margin 5
settings put system frame_override_support 0
settings put system game_default_frame_rate_override 90
settings put system enable_frame_rate_override 1
settings put system virtual_display_default_refresh_rate 90
settings put system force_max_refresh_rate 90
settings put system override_min_frame_rate 90
settings put system use_content_detection_for_refresh_rate 0
settings put system default_fps 90
settings put system disable_idle_fps 1
settings put system fps.limit.is.now locked
settings put system aod_monitor_default_fps 90
settings put system fod_monitor_default_fps 90
settings put system app_switch_fps 90
settings put system low_power_fps 90
settings put system gaming_mode_fps 90
settings put system battery_saving_mode_fps 90
settings put system idle_reduce_framerate_enable no
settings put system idle_default_fps 90
settings put system enable_dpps_dynamic_fps 0
settings put system enable_perf_hint_for_low_fps 1
settings put system low_framerate_limit 90
settings put system refresh_rate 90
settings put system default_refresh_rate 90
settings put system last_tran_refresh_mode_in_refresh_setting 90
settings put system min_refresh_rate 90
settings put system max_refresh_rate 90
settings put system refresh_default_rate 90
settings put system thermal_limit_refresh_rate 90
settings put system user_refresh_rate 90
settings put system peak_refresh_rate 90
settings put system pointer_speed 7
settings put system power_save_refresh_rate 90
settings put system tran_settings_long_battery_swith_60hz 0
settings put system tran_settings_long_battery_swith_90hz 0
settings put system tran_settings_long_battery_swith_120hz 0
settings put system tran_settings_long_battery_swith_144hz 0
settings put system tran_device_name Samsung Galaxy S25 Ultra
settings put system tran_device_name_default Samsung Galaxy S25 Ultra
settings put system tran_max_cached_processes 0
settings put system tran_default_auto_refresh_support 0
settings put system tran_low_battery_60hz_refresh_rate_support 0
settings put system tran_low_battery_90hz_refresh_rate_support 1
settings put system tran_low_battery_120hz_refresh_rate_support 1
settings put system tran_low_battery_144hz_refresh_rate_support 1
settings put system tran_90hz_refresh_rate_not_support 1
settings put system tran_120hz_refresh_rate_not_support 0
settings put system tran_144hz_refresh_rate_not_support 0
settings put system tran_60hz_refresh_rate_not_support 1
settings put system tran_refresh_rate_support 1
settings put system tran_refresh_rate_video_detector_support 1
settings put system tran_need_recovery_refresh_mode 90
settings put system transsion_refresh_rate_support 1
settings put system transsion_frame_override_support 0
settings put system tran_refresh_mode 90
settings put system display_refresh_rate 90
settings put system 90hz_refresh_rate_not_support 1
settings put system refresh_rate_video_detector_support 1
settings put system default_auto_refresh_support 0
settings put system power_saving_fps_limit 90
settings put system miui_home_animation_rate 3
settings put system adaptive_refresh_rate 0
settings put system aod_monitor_default_fps 90
settings put system enforce_refresh_rate 90
settings put system game_max_fps 90
settings put system game_min_fps 90
settings put system gaming_mode_fps 90
settings put system input_refresh_rate 90
settings put system input_sampling_rate 90
settings put system low_framerate_limit 90
settings put system refresh_rate 90
settings put system refresh_rate_adaptive 0
settings put system refresh_rate_limit 90
settings put system refresh_rate_locked 1
settings put system table_framerate 90
settings put system touch_sampling_rate 90
settings put system touch_response_rate 1
settings put system touch_sampling_rate 90
settings put system touch_sampling_rate_override 0
settings put system game_driver_fps_limit 90
settings put system game_driver_frame_skip_enable 0
settings put system game_driver_gpu_mode 1
settings put system game_driver_max_frame_rate 90
settings put system game_driver_min_frame_rate 90
settings put system game_driver_power_saving_mode 0
settings put system game_driver_vsync_enable 1
settings put system gaming_mode_fps 90
settings put system high_fps_mode 4
settings put system minimum_refresh_rate 90
settings put system sem_power_mode_refresh_rate 0,0,-1,0,2
settings put system sem_power_mode_refresh_rate_cover 0,0,-1,0,2
settings put system vendor_display_refresh_rate 90
settings put system fps_current_limit 90
settings put system NV_FPSLIMIT 90
settings put system high_frame_rate_sf_set_big_core_fps_threshold 0
settings put system frame_rate_multiple_threshold 0
settings put system scroll_boost_refreshrate 90
settings put system touch_boost_refreshrate 90
settings put system user_screen_refresh_rate 90
settings put system game_scene_more_fps 90
settings put system miui_refresh_rate 90
settings put system maximum_refresh_rate 90
settings put system SpeedControlPara ver_num=3;enable=false;thermal=99;limit_level=90,90,90,90;limit_level_up=90,90,90,90;prohibittimer=7200
settings put system power_save_pre_refresh_state 90
settings put system RUS_DDS_SWITCH_FEATURE_DAILY_LIMIT_RATE 0.95
settings put system RUS_DDS_SWITCH_FEATURE_MONTH_LIMIT_RATE 0.95
settings put system db_screen_rate 3
settings put system is_smart_fps 0
settings put secure miui_refresh_rate 90
settings put secure support_highfps 1
settings put secure user_refresh_rate 90
settings put secure refresh_rate_mode 3
settings put secure user_frame_rate_adjustment 1
settings put secure frame_drop_tolerance 3
settings put global low_power_fps 90
settings put global tran_low_battery_60hz_refresh_rate_support 0
settings put global tran_low_battery_144hz_refresh_rate_support 1
settings put global tran_low_battery_120hz_refresh_rate_support 1
settings put global tran_low_battery_90hz_refresh_rate_support 1
settings put global tran_90hz_refresh_rate_not_support 1
settings put global tran_120hz_refresh_rate_not_support 0
settings put global tran_144hz_refresh_rate_not_support 0
settings put global tran_60hz_refresh_rate_not_support 1
settings put global tran_settings_long_battery_swith_60hz 0
settings put global tran_settings_long_battery_swith_90hz 0
settings put global tran_settings_long_battery_swith_120hz 0
settings put global tran_settings_long_battery_swith_144hz 0
settings put global tran_default_auto_refresh_support 0
settings put global tran_refresh_rate_support 1
settings put global tran_refresh_rate_video_detector_support 1
settings put global tran_need_recovery_refresh_mode 90
settings put global preferred_display_refresh_rate 90
settings put global refresh_rate 90
settings put global dynamic_fps_control 0
settings put global dynamic_frame_management 0
settings put global dynamic_frame_rate 0
settings put global dynamic_refresh_rate_control 0
settings put global dont_lower_fps 1
settings put global display_refresh_rate_override 0
settings put global vivo_screen_refresh_rate_mode 90
settings put global FPSTUNER_SWITCH false
settings put global ScreenRefreshRateController_resultFps 90
settings put global double_frame_flag 0
settings put global drop_frame_flag 0
settings put global oneplus_screen_refresh_rate 3
settings put global screen_refresh_rate 3
} > /dev/null 2>&1
(
settings put system fstb_target_fps_margin_high_fps 10
settings put system fstb_target_fps_margin_low_fps 15
settings put system gcc_fps_margin 5
settings put system frame_override_support 0
settings put system game_default_frame_rate_override 90
settings put system enable_frame_rate_override 1
settings put system virtual_display_default_refresh_rate 90
settings put system force_max_refresh_rate 90
settings put system override_min_frame_rate 90
settings put system use_content_detection_for_refresh_rate 0
settings put system default_fps 90
settings put system disable_idle_fps 1
settings put system fps.limit.is.now locked
settings put system aod_monitor_default_fps 90
settings put system fod_monitor_default_fps 90
settings put system app_switch_fps 90
settings put system low_power_fps 90
settings put system gaming_mode_fps 90
settings put system battery_saving_mode_fps 90
settings put system idle_reduce_framerate_enable no
settings put system idle_default_fps 90
settings put system enable_dpps_dynamic_fps 0
settings put system enable_perf_hint_for_low_fps 1
settings put system low_framerate_limit 90
settings put system refresh_rate 90
settings put system default_refresh_rate 90
settings put system last_tran_refresh_mode_in_refresh_setting 90
settings put system min_refresh_rate 90
settings put system max_refresh_rate 90
settings put system refresh_default_rate 90
settings put system thermal_limit_refresh_rate 90
settings put system user_refresh_rate 90
settings put system peak_refresh_rate 90
settings put system pointer_speed 7
settings put system power_save_refresh_rate 90
settings put system tran_settings_long_battery_swith_60hz 0
settings put system tran_settings_long_battery_swith_90hz 0
settings put system tran_settings_long_battery_swith_120hz 0
settings put system tran_settings_long_battery_swith_144hz 0
settings put system tran_device_name Samsung Galaxy S25 Ultra
settings put system tran_device_name_default Samsung Galaxy S25 Ultra
settings put system tran_max_cached_processes 0
settings put system tran_default_auto_refresh_support 0
settings put system tran_low_battery_60hz_refresh_rate_support 0
settings put system tran_low_battery_90hz_refresh_rate_support 1
settings put system tran_low_battery_120hz_refresh_rate_support 1
settings put system tran_low_battery_144hz_refresh_rate_support 1
settings put system tran_90hz_refresh_rate_not_support 1
settings put system tran_120hz_refresh_rate_not_support 0
settings put system tran_144hz_refresh_rate_not_support 0
settings put system tran_60hz_refresh_rate_not_support 1
settings put system tran_refresh_rate_support 1
settings put system tran_refresh_rate_video_detector_support 1
settings put system tran_need_recovery_refresh_mode 90
settings put system transsion_refresh_rate_support 1
settings put system transsion_frame_override_support 0
settings put system tran_refresh_mode 90
settings put system display_refresh_rate 90
settings put system 90hz_refresh_rate_not_support 1
settings put system refresh_rate_video_detector_support 1
settings put system default_auto_refresh_support 0
settings put system power_saving_fps_limit 90
settings put system miui_home_animation_rate 3
settings put system adaptive_refresh_rate 0
settings put system aod_monitor_default_fps 90
settings put system enforce_refresh_rate 90
settings put system game_max_fps 90
settings put system game_min_fps 90
settings put system gaming_mode_fps 90
settings put system input_refresh_rate 90
settings put system input_sampling_rate 90
settings put system low_framerate_limit 90
settings put system refresh_rate 90
settings put system refresh_rate_adaptive 0
settings put system refresh_rate_limit 90
settings put system refresh_rate_locked 1
settings put system table_framerate 90
settings put system touch_sampling_rate 90
settings put system touch_response_rate 1
settings put system touch_sampling_rate 90
settings put system touch_sampling_rate_override 0
settings put system game_driver_fps_limit 90
settings put system game_driver_frame_skip_enable 0
settings put system game_driver_gpu_mode 1
settings put system game_driver_max_frame_rate 90
settings put system game_driver_min_frame_rate 90
settings put system game_driver_power_saving_mode 0
settings put system game_driver_vsync_enable 1
settings put system gaming_mode_fps 90
settings put system high_fps_mode 4
settings put system minimum_refresh_rate 90
settings put system sem_power_mode_refresh_rate 0,0,-1,0,2
settings put system sem_power_mode_refresh_rate_cover 0,0,-1,0,2
settings put system vendor_display_refresh_rate 90
settings put system fps_current_limit 90
settings put system NV_FPSLIMIT 90
settings put system high_frame_rate_sf_set_big_core_fps_threshold 0
settings put system frame_rate_multiple_threshold 0
settings put system scroll_boost_refreshrate 90
settings put system touch_boost_refreshrate 90
settings put system user_screen_refresh_rate 90
settings put system game_scene_more_fps 90
settings put system miui_refresh_rate 90
settings put system maximum_refresh_rate 90
settings put system SpeedControlPara ver_num=3;enable=false;thermal=99;limit_level=90,90,90,90;limit_level_up=90,90,90,90;prohibittimer=7200
settings put system power_save_pre_refresh_state 90
settings put system RUS_DDS_SWITCH_FEATURE_DAILY_LIMIT_RATE 0.95
settings put system RUS_DDS_SWITCH_FEATURE_MONTH_LIMIT_RATE 0.95
settings put system db_screen_rate 3
settings put system is_smart_fps 0
settings put secure miui_refresh_rate 90
settings put secure support_highfps 1
settings put secure user_refresh_rate 90
settings put secure refresh_rate_mode 3
settings put secure user_frame_rate_adjustment 1
settings put secure frame_drop_tolerance 3
settings put global low_power_fps 90
settings put global tran_low_battery_60hz_refresh_rate_support 0
settings put global tran_low_battery_144hz_refresh_rate_support 1
settings put global tran_low_battery_120hz_refresh_rate_support 1
settings put global tran_low_battery_90hz_refresh_rate_support 1
settings put global tran_90hz_refresh_rate_not_support 1
settings put global tran_120hz_refresh_rate_not_support 0
settings put global tran_144hz_refresh_rate_not_support 0
settings put global tran_60hz_refresh_rate_not_support 1
settings put global tran_settings_long_battery_swith_60hz 0
settings put global tran_settings_long_battery_swith_144hz 0
settings put global tran_settings_long_battery_swith_120hz 0
settings put global tran_settings_long_battery_swith_90hz 0
settings put global tran_default_auto_refresh_support 0
settings put global tran_refresh_rate_support 1
settings put global tran_refresh_rate_video_detector_support 1
settings put global tran_need_recovery_refresh_mode 90
settings put global preferred_display_refresh_rate 90
settings put global refresh_rate 90
settings put global dynamic_fps_control 0
settings put global dynamic_frame_management 0
settings put global dynamic_frame_rate 0
settings put global dynamic_refresh_rate_control 0
settings put global dont_lower_fps 1
settings put global display_refresh_rate_override 0
settings put global vivo_screen_refresh_rate_mode 90
settings put global FPSTUNER_SWITCH false
settings put global ScreenRefreshRateController_resultFps 90
settings put global double_frame_flag 0
settings put global drop_frame_flag 0
settings put global oneplus_screen_refresh_rate 3
settings put global screen_refresh_rate 3
) > /dev/null 2>&1
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Selesai Memasang Tweak Settings Cadangan.' > /dev/null 2>&1
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Memasang Tweak Setprop Fps, Frame Rate & Sampling Rate.' > /dev/null 2>&1
android_properties=(
  "debug.renderengine.target_fps 90"
  "debug.thermal.throttle.support no"
  "debug.disable.thermal.control 1"
  "debug.hwui.disable_vsync true"
  "debug.cpurend.vsync false"
  "debug.gpurend.vsync false"
  "debug.egl.hw 1"
  "debug.hwc.force_gpu_vsync false"
  "debug.hwui.force_no_vsync true"
  "debug.hwui.skip_vsync true"
  "debug.hwc.fakevsync 0"
  "debug.hwc.logvsync 1"
  "debug.touch.sampling_rate 240"
  "debug.touchscreen.report_rate 240"
  "debug.egl.swapinterval 0"
  "debug.gr.swapinterval 0"
  "debug.sf.swapinterval 0"
  "debug.redroid.fps 90"
  "debug.perf_event_max_sample_rate 240"
  "debug.hwui.fps_divisor 0"
  "debug.hwui.profile.maxframes 90"
  "debug.hwui.fpslimit 90"
  "debug.hwui.fps_limit 90"
  "debug.OVRPlugin.systemDisplayFrequency 90"
  "debug.mediatek.high_frame_rate_sf_set_big_core_fps_threshold 0"
  "debug.refresh_rate.min_fps 90"
  "debug.refresh_rate.max_fps 90"
  "debug.refresh_rate.peak_fps 90"
  "debug.hwc.dynamic_refresh_rate false"
  "debug.hwc.lock_refresh_rate true"
  "debug.hwc.refresh_rate 90"
  "debug.sf.90_fps.hwc.min.duration 50000"
  "debug.sf.prim_perf_90hz_base_brightness_zone 90:90:90,90:90:90"
  "debug.sf.prim_perf_90hz_base_brightness_zone 90:90:90,90:90:90,90:90:90"
  "debug.sf.prim_std_brightness_zone 90:90:90,90:90:90"
  "debug.sf.cli_perf_brightness_zone 90:90:90"
  "debug.sf.cli_std_brightness_zone 90:90:90"
  "debug.sf.scroll_boost_refreshrate 90"
  "debug.sf.touch_boost_refreshrate 90"
  "debug.sf.showupdates 0"
  "debug.sf.showcpu 0"
  "debug.sf.showbackground 0"
  "debug.sf.showfps 0"
  "debug.sf.frame_rate_multiple_threshold 0"
  "debug.sf.enable_refresh_rate_restriction_for_app_switch 1"
  "debug.sf.region_sampling_timer_timeout_ns 50000"
  "debug.sf.region_sampling_period_ns 50000"
  "debug.sf.90_fps.late.sf.duration 50000"
  "debug.sf.90_fps.late.app.duration 50000"
  "debug.sf.90_fps.early.sf.duration 50000"
  "debug.sf.90_fps.early.app.duration 50000"
  "debug.sf.90_fps.earlyGl.sf.duration 50000"
  "debug.sf.90_fps.earlyGl.app.duration 50000"
  "debug.sf.luma_sampling 1"
  "debug.sf.show_refresh_rate_overlay_spinner 0"
  "debug.sf.show_refresh_rate_overlay_render_rate 0"
  "debug.sf.show_refresh_rate_overlay_in_middle 0"
  "debug.sf.force_double_refresh_rate 0"
  "debug.sf.disable_dynamic_refresh_rate true"
  "debug.sf.showrefreshrate 1"
  "debug.sf.swaprect 1"
  "debug.sf.hwc_hotplug_error_via_neg_vsync false"
  "debug.sf.ignore_hwc_physical_display_orientation false"
  "debug.sf.hwc_hdcp_via_neg_vsync false"
  "debug.sf.no_hw_vsync 1"
  "debug.sf.vsync_reactor_ignore_present_fences 0"
  "debug.sf.vsync_reactor false"
  "debug.sf.phase_offset_threshold_for_next_vsync_ns 0"
)
for prop in "${android_properties[@]}"; do
   setprop $prop > /dev/null 2>&1
done
android_properties() {
setprop debug.renderengine.target_fps 90
setprop debug.thermal.throttle.support no
setprop debug.disable.thermal.control 1
setprop debug.hwui.disable_vsync true
setprop debug.cpurend.vsync false
setprop debug.gpurend.vsync false
setprop debug.egl.hw 1
setprop debug.hwc.force_gpu_vsync false
setprop debug.hwui.force_no_vsync true
setprop debug.hwui.skip_vsync true
setprop debug.hwc.fakevsync 0
setprop debug.hwc.logvsync 1
setprop debug.touch.sampling_rate 240
setprop debug.touchscreen.report_rate 240
setprop debug.egl.swapinterval 0
setprop debug.gr.swapinterval 0
setprop debug.sf.swapinterval 0
setprop debug.redroid.fps 90
setprop debug.perf_event_max_sample_rate 240
setprop debug.hwui.fps_divisor 0
setprop debug.hwui.profile.maxframes 90
setprop debug.hwui.fpslimit 90
setprop debug.hwui.fps_limit 90
setprop debug.OVRPlugin.systemDisplayFrequency 90
setprop debug.mediatek.high_frame_rate_sf_set_big_core_fps_threshold 0
setprop debug.refresh_rate.min_fps 90
setprop debug.refresh_rate.max_fps 90
setprop debug.refresh_rate.peak_fps 90
setprop debug.hwc.dynamic_refresh_rate false
setprop debug.hwc.lock_refresh_rate true
setprop debug.hwc.refresh_rate 90
setprop debug.sf.90_fps.hwc.min.duration 50000
setprop debug.sf.prim_perf_90hz_base_brightness_zone 90:90:90,90:90:90
setprop debug.sf.prim_perf_90hz_base_brightness_zone 90:90:90,90:90:90,90:90:90
setprop debug.sf.prim_std_brightness_zone 90:90:90,90:90:90
setprop debug.sf.cli_perf_brightness_zone 90:90:90
setprop debug.sf.cli_std_brightness_zone 90:90:90
setprop debug.sf.scroll_boost_refreshrate 90
setprop debug.sf.touch_boost_refreshrate 90
setprop debug.sf.showupdates 0
setprop debug.sf.showcpu 0
setprop debug.sf.showbackground 0
setprop debug.sf.showfps 0
setprop debug.sf.frame_rate_multiple_threshold 0
setprop debug.sf.enable_refresh_rate_restriction_for_app_switch 1
setprop debug.sf.region_sampling_timer_timeout_ns 50000
setprop debug.sf.region_sampling_period_ns 50000
setprop debug.sf.90_fps.late.sf.duration 50000
setprop debug.sf.90_fps.late.app.duration 50000
setprop debug.sf.90_fps.early.sf.duration 50000
setprop debug.sf.90_fps.early.app.duration 50000
setprop debug.sf.90_fps.earlyGl.sf.duration 50000
setprop debug.sf.90_fps.earlyGl.app.duration 50000
setprop debug.sf.luma_sampling 1
setprop debug.sf.show_refresh_rate_overlay_spinner 0
setprop debug.sf.show_refresh_rate_overlay_render_rate 0
setprop debug.sf.show_refresh_rate_overlay_in_middle 0
setprop debug.sf.force_double_refresh_rate 0
setprop debug.sf.disable_dynamic_refresh_rate true
setprop debug.sf.showrefreshrate 1
setprop debug.sf.swaprect 1
setprop debug.sf.hwc_hotplug_error_via_neg_vsync false
setprop debug.sf.ignore_hwc_physical_display_orientation false
setprop debug.sf.hwc_hdcp_via_neg_vsync false
setprop debug.sf.no_hw_vsync 1
setprop debug.sf.vsync_reactor_ignore_present_fences 0
setprop debug.sf.vsync_reactor false
setprop debug.sf.phase_offset_threshold_for_next_vsync_ns 0
}
android_properties > /dev/null 2>&1 
(
setprop debug.renderengine.target_fps 90
setprop debug.thermal.throttle.support no
setprop debug.disable.thermal.control 1
setprop debug.hwui.disable_vsync true
setprop debug.cpurend.vsync false
setprop debug.gpurend.vsync false
setprop debug.egl.hw 1
setprop debug.hwc.force_gpu_vsync false
setprop debug.hwui.force_no_vsync true
setprop debug.hwui.skip_vsync true
setprop debug.hwc.fakevsync 0
setprop debug.hwc.logvsync 1
setprop debug.touch.sampling_rate 240
setprop debug.touchscreen.report_rate 240
setprop debug.egl.swapinterval 0
setprop debug.gr.swapinterval 0
setprop debug.sf.swapinterval 0
setprop debug.redroid.fps 90
setprop debug.perf_event_max_sample_rate 240
setprop debug.hwui.fps_divisor 0
setprop debug.hwui.profile.maxframes 90
setprop debug.hwui.fpslimit 90
setprop debug.hwui.fps_limit 90
setprop debug.OVRPlugin.systemDisplayFrequency 90
setprop debug.mediatek.high_frame_rate_sf_set_big_core_fps_threshold 0
setprop debug.refresh_rate.min_fps 90
setprop debug.refresh_rate.max_fps 90
setprop debug.refresh_rate.peak_fps 90
setprop debug.hwc.dynamic_refresh_rate false
setprop debug.hwc.lock_refresh_rate true
setprop debug.hwc.refresh_rate 90
setprop debug.sf.90_fps.hwc.min.duration 50000
setprop debug.sf.prim_perf_90hz_base_brightness_zone 90:90:90,90:90:90
setprop debug.sf.prim_perf_90hz_base_brightness_zone 90:90:90,90:90:90,90:90:90
setprop debug.sf.prim_std_brightness_zone 90:90:90,90:90:90
setprop debug.sf.cli_perf_brightness_zone 90:90:90
setprop debug.sf.cli_std_brightness_zone 90:90:90
setprop debug.sf.scroll_boost_refreshrate 90
setprop debug.sf.touch_boost_refreshrate 90
setprop debug.sf.showupdates 0
setprop debug.sf.showcpu 0
setprop debug.sf.showbackground 0
setprop debug.sf.showfps 0
setprop debug.sf.frame_rate_multiple_threshold 0
setprop debug.sf.enable_refresh_rate_restriction_for_app_switch 1
setprop debug.sf.region_sampling_timer_timeout_ns 50000
setprop debug.sf.region_sampling_period_ns 50000
setprop debug.sf.90_fps.late.sf.duration 50000
setprop debug.sf.90_fps.late.app.duration 50000
setprop debug.sf.90_fps.early.sf.duration 50000
setprop debug.sf.90_fps.early.app.duration 50000
setprop debug.sf.90_fps.earlyGl.sf.duration 50000
setprop debug.sf.90_fps.earlyGl.app.duration 50000
setprop debug.sf.luma_sampling 1
setprop debug.sf.show_refresh_rate_overlay_spinner 0
setprop debug.sf.show_refresh_rate_overlay_render_rate 0
setprop debug.sf.show_refresh_rate_overlay_in_middle 0
setprop debug.sf.force_double_refresh_rate 0
setprop debug.sf.disable_dynamic_refresh_rate true
setprop debug.sf.showrefreshrate 1
setprop debug.sf.swaprect 1
setprop debug.sf.hwc_hotplug_error_via_neg_vsync false
setprop debug.sf.ignore_hwc_physical_display_orientation false
setprop debug.sf.hwc_hdcp_via_neg_vsync false
setprop debug.sf.no_hw_vsync 1
setprop debug.sf.vsync_reactor_ignore_present_fences 0
setprop debug.sf.vsync_reactor false
setprop debug.sf.phase_offset_threshold_for_next_vsync_ns 0
) > /dev/null 2>&1 
{
setprop debug.renderengine.target_fps 90
setprop debug.thermal.throttle.support no
setprop debug.disable.thermal.control 1
setprop debug.hwui.disable_vsync true
setprop debug.cpurend.vsync false
setprop debug.gpurend.vsync false
setprop debug.egl.hw 1
setprop debug.hwc.force_gpu_vsync false
setprop debug.hwui.force_no_vsync true
setprop debug.hwui.skip_vsync true
setprop debug.hwc.fakevsync 0
setprop debug.hwc.logvsync 1
setprop debug.touch.sampling_rate 240
setprop debug.touchscreen.report_rate 240
setprop debug.egl.swapinterval 0
setprop debug.gr.swapinterval 0
setprop debug.sf.swapinterval 0
setprop debug.redroid.fps 90
setprop debug.perf_event_max_sample_rate 240
setprop debug.hwui.fps_divisor 0
setprop debug.hwui.profile.maxframes 90
setprop debug.hwui.fpslimit 90
setprop debug.hwui.fps_limit 90
setprop debug.OVRPlugin.systemDisplayFrequency 90
setprop debug.mediatek.high_frame_rate_sf_set_big_core_fps_threshold 0
setprop debug.refresh_rate.min_fps 90
setprop debug.refresh_rate.max_fps 90
setprop debug.refresh_rate.peak_fps 90
setprop debug.hwc.dynamic_refresh_rate false
setprop debug.hwc.lock_refresh_rate true
setprop debug.hwc.refresh_rate 90
setprop debug.sf.90_fps.hwc.min.duration 50000
setprop debug.sf.prim_perf_90hz_base_brightness_zone 90:90:90,90:90:90
setprop debug.sf.prim_perf_90hz_base_brightness_zone 90:90:90,90:90:90,90:90:90
setprop debug.sf.prim_std_brightness_zone 90:90:90,90:90:90
setprop debug.sf.cli_perf_brightness_zone 90:90:90
setprop debug.sf.cli_std_brightness_zone 90:90:90
setprop debug.sf.scroll_boost_refreshrate 90
setprop debug.sf.touch_boost_refreshrate 90
setprop debug.sf.showupdates 0
setprop debug.sf.showcpu 0
setprop debug.sf.showbackground 0
setprop debug.sf.showfps 0
setprop debug.sf.frame_rate_multiple_threshold 0
setprop debug.sf.enable_refresh_rate_restriction_for_app_switch 1
setprop debug.sf.region_sampling_timer_timeout_ns 50000
setprop debug.sf.region_sampling_period_ns 50000
setprop debug.sf.90_fps.late.sf.duration 50000
setprop debug.sf.90_fps.late.app.duration 50000
setprop debug.sf.90_fps.early.sf.duration 50000
setprop debug.sf.90_fps.early.app.duration 50000
setprop debug.sf.90_fps.earlyGl.sf.duration 50000
setprop debug.sf.90_fps.earlyGl.app.duration 50000
setprop debug.sf.luma_sampling 1
setprop debug.sf.show_refresh_rate_overlay_spinner 0
setprop debug.sf.show_refresh_rate_overlay_render_rate 0
setprop debug.sf.show_refresh_rate_overlay_in_middle 0
setprop debug.sf.force_double_refresh_rate 0
setprop debug.sf.disable_dynamic_refresh_rate true
setprop debug.sf.showrefreshrate 1
setprop debug.sf.swaprect 1
setprop debug.sf.hwc_hotplug_error_via_neg_vsync false
setprop debug.sf.ignore_hwc_physical_display_orientation false
setprop debug.sf.hwc_hdcp_via_neg_vsync false
setprop debug.sf.no_hw_vsync 1
setprop debug.sf.vsync_reactor_ignore_present_fences 0
setprop debug.sf.vsync_reactor false
setprop debug.sf.phase_offset_threshold_for_next_vsync_ns 0
} > /dev/null 2>&1 
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Selesai Memasang Tweak Setprop Fps, Frame Rate & Sampling Rate.' > /dev/null 2>&1
sleep 0.5
echo "Pemasangan Module Samsung Galaxy S25 Ultra ❗❗"
echo ""
sleep 5
echo " [■□□□□□□□□□]  "
sleep 2
echo " [■■□□□□□□□□]  "
sleep 2
echo " [■■■□□□□□□□]  "
sleep 2
echo " [■■■■□□□□□□]  "
sleep 2
echo " [■■■■■□□□□□]  "
sleep 2
echo " [■■■■■■□□□□]  "
sleep 2
echo " [■■■■■■■□□□]  "
sleep 2
echo " [■■■■■■■■□□]  "
sleep 2
echo " [■■■■■■■■■□] "
sleep 0.5
echo ""
echo "Success Terpasang Module Samsung Galaxy S25 Ultra ❗❗"
echo ""
cmd notification post -S bigtext -t '⚡ @modulegaming6969fps' 'Tag' 'Successfully Applied.' > /dev/null 2>&1
echo "╔═╦╗╔╦╗╔═╦═╦╦╦╦╗╔═╗"
echo "║╚╣║║║╚╣╚╣╔╣╔╣║╚╣═╣"
echo "╠╗║╚╝║║╠╗║╚╣║║║║║═╣"
echo "╚═╩══╩═╩═╩═╩╝╚╩═╩═╝"

# Menunggu 5 detik sebelum membuka aplikasi YouTube
echo "Menunggu 5 detik sebelum membuka aplikasi YouTube..."
sleep 5

# Membuka URL YouTube
am start -a android.intent.action.VIEW -d "https://www.youtube.com/channel/UCp3d_0F3VISlkarGJyflXFQ/join"