

import { Link } from '@tanstack/react-router';
import { useReadContract, useAccount } from 'wagmi';
import abi from "../abi/launchtk.json";
import { TokenCard } from './TokenCard'; // Import the new TokenCard component

const ContractAddress = '0xAAd78a5cDe5996e43B6F10302eA3CEF432d7b014' as `0x${string}`; // Updated Contract Address

// Define the type for the token details object based on the ABI
interface TokenDetails {
  name: string;
  symbol: string;
  decimals: number; // ABI shows uint8, which is a number in TS
  tokenAddress: `0x${string}`;
}

export function ExplorePage() {
  const { isConnected } = useAccount();

  const { data: allTokenDetails, error: tokenDetailsError, isLoading: isLoadingTokenDetails } = useReadContract({
    abi,
    address: ContractAddress,
    functionName: 'getAllTokenDetails', // Changed to fetch all details
    query: { 
      enabled: isConnected,
      staleTime: 60 * 1000, 
      gcTime: 5 * 60 * 1000, 
    }
  });

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
        {!isConnected ? (
          <div className="text-center py-12">
            <p className="text-2xl text-slate-400">Please connect your wallet to view launched tokens.</p>
          </div>
        ) : isLoadingTokenDetails ? ( // Changed variable name
          <div className="text-center py-12">
            <p className="text-2xl text-slate-400">Loading token list...</p>
            <svg className="animate-spin mx-auto mt-4 h-10 w-10 text-sky-400" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
              <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
              <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
            </svg>
          </div>
        ) : tokenDetailsError ? ( // Corrected variable name
          <div className="text-center py-12">
            <p className="text-2xl text-red-400">Error loading token list: {tokenDetailsError.message}</p> {/* Corrected variable name */}
          </div>
        ) : !allTokenDetails || (allTokenDetails as TokenDetails[]).length === 0 ? ( // Corrected variable name and type assertion
          <div className="text-center py-12">
            <p className="text-2xl text-slate-400">No tokens launched yet or found on the contract.</p>
            <Link to="/" className="mt-4 inline-block px-6 py-2 bg-purple-600 hover:bg-purple-700 rounded-lg font-semibold transition-colors">
              Launch a Token
            </Link>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8">
            {(allTokenDetails as TokenDetails[]).map((detail) => ( // Corrected mapping and prop
              <TokenCard key={detail.tokenAddress} tokenDetail={detail} />
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