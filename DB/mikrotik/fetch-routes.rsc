# fetch-routes.rsc — MikroTik RouterOS script
#
# Fetches pre-generated routes from public GitHub repo and imports them.
#
# Setup:
#   1. Upload to router:
#      /system script add name=fetch-mihomo-routes source=[/file get fetch-routes.rsc contents]
#   2. Run once to test:
#      /system script run fetch-mihomo-routes
#   3. Schedule every 15 minutes:
#      /system scheduler add name=fetch-mihomo-routes interval=15m on-event=fetch-mihomo-routes

/tool fetch url="https://raw.githubusercontent.com/BUTLER-SPB/Public/main/DB/mikrotik/routes.rsc" mode=https dst-path=mihomo-routes.rsc
:if ([/file get mihomo-routes.rsc size] > 0) do={
  /import mihomo-routes.rsc
}
/file remove mihomo-routes.rsc
