%{
  site_name: "impact punk",
  site_description: "stop talking - have impact",
  date_format: "{WDfull}, {D} {Mshort} {YYYY}",
  base_url: "/",
  author: "lenz gschwendtner",
  author_email: "e@lnz.me",
  plugins: [
    {Serum.Plugins.LiveReloader, only: :dev}
  ]
}
