

// Mock data for tokens - in a real app, this would come from an API or blockchain query
const mockTokens = [
  {
    id: '1',
    name: 'Super Privacy Coin',
    symbol: 'SPC',
    creator: '0xAlice123...xyz',
    description: 'A revolutionary coin focused on untraceable transactions and ultimate user privacy.',
    imageUrl: 'https://via.placeholder.com/100/FFD700/000000?Text=SPC',
    marketCap: '$1,200,000',
    volume24h: '$50,000',
    launchedDate: '2024-07-15',
  },
  {
    id: '2',
    name: 'Secure DeFi Token',
    symbol: 'SDT',
    creator: '0xBob456...abc',
    description: 'Bringing privacy to decentralized finance. Securely lend, borrow, and trade.',
    imageUrl: 'https://via.placeholder.com/100/7FFF00/000000?Text=SDT',
    marketCap: '$850,000',
    volume24h: '$25,000',
    launchedDate: '2024-06-20',
  },
  {
    id: '3',
    name: 'Anonymous NFT Pass',
    symbol: 'ANP',
    creator: '0xCarol789...def',
    description: 'Exclusive access NFTs with privacy-preserving features for holders.',
    imageUrl: 'https://via.placeholder.com/100/00FFFF/000000?Text=ANP',
    marketCap: 'N/A (NFT)',
    volume24h: '$5,000',
    launchedDate: '2024-08-01',
  },
  {
    id: '4',
    name: 'StealthPay',
    symbol: 'STP',
    creator: '0xDave101...ghi',
    description: 'A simple and private way to make everyday payments on the blockchain.',
    imageUrl: 'https://via.placeholder.com/100/FF00FF/FFFFFF?Text=STP',
    marketCap: '$500,000',
    volume24h: '$10,000',
    launchedDate: '2024-05-10',
  },
];

import { Link } from '@tanstack/react-router';

export function ExplorePage() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-900 to-slate-800 text-white p-4 sm:p-8 font-sans flex flex-col items-center">
      <nav className="w-full max-w-4xl mx-auto mb-10 p-3 bg-slate-800/50 rounded-lg shadow-lg">
        <div className="flex justify-center items-center gap-6 text-lg">
          <Link
            to="/"
            activeProps={{
              className: 'font-bold text-pink-400 border-b-2 border-pink-400',
            }}
            className="px-3 py-2 hover:text-pink-300 transition-colors duration-150"
          >
            🚀 Launch Token
          </Link>
          <Link
            to='/explore'
            activeProps={{
              className: 'font-bold text-sky-400 border-b-2 border-sky-400',
            }}
            className="px-3 py-2 hover:text-sky-300 transition-colors duration-150"
          >
            🌍 Explore Tokens
          </Link>
        </div>
      </nav>
      <header className="w-full max-w-5xl mx-auto mb-10 text-center">
        <h1 className="text-4xl sm:text-5xl font-bold mb-3 bg-clip-text text-transparent bg-gradient-to-r from-sky-400 via-cyan-500 to-teal-500">
          Explore Launched Tokens
        </h1>
        <p className="text-lg text-slate-300">
          Discover new and exciting privacy-focused tokens launched on our platform.
        </p>
      </header>

      <main className="w-full max-w-5xl mx-auto">
        {mockTokens.length === 0 ? (
          <div className="text-center py-12">
            <p className="text-2xl text-slate-400">No tokens launched yet. Be the first!</p>
            {/* Optional: Link to the launch page */}
            {/* <Link to="/" className="mt-4 inline-block px-6 py-2 bg-purple-600 hover:bg-purple-700 rounded-lg font-semibold transition-colors">
              Launch a Token
            </Link> */}
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8">
            {mockTokens.map((token) => (
              <div
                key={token.id}
                className="bg-slate-800/60 rounded-xl shadow-2xl p-6 hover:shadow-purple-500/30 transition-all duration-300 ease-in-out transform hover:-translate-y-1 flex flex-col"
              >
                <div className="flex items-center mb-4">
                  <img src={token.imageUrl} alt={`${token.name} logo`} className="w-16 h-16 rounded-full mr-4 border-2 border-slate-700" />
                  <div>
                    <h2 className="text-2xl font-semibold text-sky-300">{token.name} ({token.symbol})</h2>
                    <p className="text-xs text-slate-400">Launched: {token.launchedDate}</p>
                  </div>
                </div>
                <p className="text-slate-300 leading-relaxed mb-4 text-sm flex-grow">
                  {token.description}
                </p>
                <div className="mt-auto pt-4 border-t border-slate-700/50 space-y-2 text-xs">
                  <div className="flex justify-between">
                    <span className="text-slate-400">Market Cap:</span>
                    <span className="font-medium text-teal-300">{token.marketCap}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-slate-400">24h Volume:</span>
                    <span className="font-medium text-teal-300">{token.volume24h}</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-slate-400">Creator:</span>
                    <span className="font-medium text-purple-300 truncate hover:text-clip" title={token.creator}>
                      {token.creator.substring(0, 10)}...
                    </span>
                  </div>
                </div>
                {/* Optional: Add a button to view more details or interact with the token */}
                {/* <button className="mt-5 w-full py-2 bg-sky-600 hover:bg-sky-700 rounded-lg font-semibold transition-colors text-sm">
                  View Details
                </button> */}
              </div>
            ))}
          </div>
        )}
      </main>

      <footer className="w-full max-w-5xl mx-auto mt-16 pt-8 border-t border-slate-700 text-center">
        <p className="text-slate-400">
          Tokens launched here leverage the Encrypted ERC-20 standard for enhanced privacy.
        </p>
      </footer>
    </div>
  );
}