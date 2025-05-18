/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  images: {
    domains: ['freakme.fun'],
    unoptimized: true,
  },
  i18n: {
    locales: ['en', 'pt', 'sw', 'es'],
    defaultLocale: 'en',
  },
  async redirects() {
    return [
      {
        source: '/web3',
        destination: '/web3-coming-soon',
        permanent: false,
      },
    ];
  },
}

module.exports = nextConfig
