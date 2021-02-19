const path = require("path")

module.exports = {
  "outputDir": path.resolve(__dirname, "./dist"),
  "assetsDir": "static",
  "devServer": {
    "proxy": {
      "^/api": {
        "target": "http://localhost:3030",
        "ws": true,
        "changeOrigin": true
      }
    }
  },
  "transpileDependencies": [
    "vuetify"
  ]
}