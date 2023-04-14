module.exports = {
  // content: ["./views/admin/**/**/*.ejs"],
  content: ["./views/user/**/*.ejs", "./views/shared/**/*.ejs"],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Roboto", "sans-serif"],
      },
      colors: {
        primaryBg: "#F0F0F0",
        primaryRed: "#FF2626",
        secondaryRed: "#BD1616",
        darkBlue: "#222831",
      },
    },
  },
  plugins: [],
};
