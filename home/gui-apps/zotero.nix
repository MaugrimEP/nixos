{ lib, ... }:
{
  home.activation.zoteroConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ZOTERO_DIR="$HOME/.zotero/zotero"
    if [ -d "$ZOTERO_DIR" ]; then
      for profile_dir in "$ZOTERO_DIR"/*/; do
        if [ -d "$profile_dir" ]; then
          cat > "$profile_dir/user.js" << 'EOF'
user_pref("extensions.zotero.dataDir", "/home/tmayet/gdrive/zotero_data");
user_pref("extensions.zotero.useDataDir", true);
user_pref("extensions.zotero.baseAttachmentPath", "/home/tmayet/gdrive/zotero_storage");
EOF
        fi
      done
    fi
  '';
}
