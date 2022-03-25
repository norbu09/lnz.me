%{
  site_name: "impact punk",
  site_description: "stop talking and do stuff",
  date_format: "{WDfull}, {D} {Mshort} {YYYY}",
  base_url: "/",
  author: "Lenz Gschwendtner",
  author_email: "e@lnz.me",
  plugins: [
    {Serum.Plugins.LiveReloader, only: :dev}
  ]
}
