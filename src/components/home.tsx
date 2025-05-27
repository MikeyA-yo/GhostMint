import React from 'react';
import { useAccount, useConnect, useDisconnect, useWriteContract } from 'wagmi';
// import { injected } from 'wagmi/connectors'; // Corrected import for wagmi v2
// import { parseAbi } from 'viem';
import abi from "../abi/launchtk.json"
// const fakeAbi = parseAbi([
//   'function launchToken(string name, string symbol) public',
// ]);
const ContractAddress = '0x556c78ff8D994Cfc2F774B86a342801FA75ABE0D' as `0x${string}`;
const registrar = '0x0165878A594ca255338adfa4d48449f69242Eb8F' as `0x${string}`;
const verifier = '0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9' as `0x${string}`;
import { Link } from '@tanstack/react-router';

export function Home() {
  const { address, isConnected } = useAccount();
  const { connect, connectors, error: connectError, isPending: isConnecting } = useConnect();
  const { disconnect } = useDisconnect();
  const { writeContract, isPending: isLaunching } = useWriteContract(); 
  const [tokenName, setTokenName] = React.useState('');
  const [tokenSymbol, setTokenSymbol] = React.useState('');
  const [tokenDecimals, setTokenDecimals] = React.useState<number | ''>(18);
  const [toast, setToast] = React.useState<{ type: 'success' | 'error'; message: string } | null>(null);

  const handleLaunchToken = async () => {
    if (!isConnected) {
      alert('Please connect your wallet first.');
      return;
    }
    if (!tokenName.trim() || !tokenSymbol.trim() || tokenDecimals === '') {
      alert('Please enter token name, symbol, and decimals.');
      return;
    }
    if (typeof tokenDecimals === 'number' && (tokenDecimals < 0 || tokenDecimals > 18)) {
      alert('Decimals must be between 0 and 18.');
      return;
    }

    try {
      writeContract({
        abi,
        address: ContractAddress,
        functionName: 'launchToken',
        args: [tokenName, tokenSymbol, Number(tokenDecimals), registrar, verifier], // Added decimals, registrar, and verifier
      }, {
        onSuccess: (data) => {
          console.log('Token launched successfully', data);
          setToast({ type: 'success', message: 'Token launch transaction sent! Check your wallet.' });
          setTokenName('');
          setTokenSymbol('');
          setTokenDecimals(18);
        },
        onError: (error) => {
          console.error('Error launching token:', error);
          setToast({ type: 'error', message: `Failed to launch token: ${ error.message}` });
        }
      });
      // Removed direct alert, toast will handle notifications
    } catch (error) {
      // This catch block might be redundant if onError in writeContract handles all errors
      console.error('Unexpected error in handleLaunchToken:', error);
      setToast({ type: 'error', message: 'An unexpected error occurred. Please try again.' });
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-900 to-slate-800 text-white p-4 sm:p-8 flex flex-col items-center font-sans relative">
      {/* Toast Notification */}
      {toast && (
        <div 
          className={`fixed top-5 right-5 p-4 rounded-lg shadow-lg text-white z-50 flex items-center justify-between max-w-sm animate-fadeInOut ${toast.type === 'success' ? 'bg-green-600' : 'bg-red-600'}`}
        >
          <p>{toast.message}</p>
          <button 
            onClick={() => setToast(null)} 
            className="ml-4 text-xl font-semibold hover:text-slate-200"
          >
            &times;
          </button>
        </div>
      )}
      <style>
        {`
          @keyframes fadeInOut {
            0% { opacity: 0; transform: translateY(-20px); }
            10% { opacity: 1; transform: translateY(0); }
            90% { opacity: 1; transform: translateY(0); }
            100% { opacity: 0; transform: translateY(-20px); }
          }
          .animate-fadeInOut {
            animation: fadeInOut 4s forwards;
          }
        `}
      </style>
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
      <header className="w-full max-w-4xl mb-10 text-center">
        <h1 className="text-5xl sm:text-6xl font-bold mb-3 bg-clip-text text-transparent bg-gradient-to-r from-purple-400 via-pink-500 to-red-500">
          Launch Your Secure Token
        </h1>
        <p className="text-xl text-slate-300">
          Create and launch your own privacy-enhanced tokens on Avalanche, simply and securely.
        </p>
        <div className="mt-8">
          {isConnected ? (
            <div className="flex flex-col items-center">
              <p className="text-sm text-slate-400 mb-2">Connected: {address}</p>
              <button
                onClick={() => disconnect()}
                className="px-6 py-2 bg-red-600 hover:bg-red-700 rounded-lg font-semibold transition-colors shadow-md"
              >
                Disconnect Wallet
              </button>
            </div>
          ) : (
            <div className="flex flex-col items-center space-y-3">
              {connectors.map((connector) => (
                <button
                  key={connector.id}
                  onClick={() => connect({ connector })}
                  disabled={isConnecting && connector.id === connect.arguments?.[0]?.connector?.id}
                  className="px-8 py-3 bg-purple-600 hover:bg-purple-700 rounded-lg font-semibold text-lg transition-colors shadow-lg w-full max-w-xs"
                >
                  {isConnecting && connector.id === connect.arguments?.[0]?.connector?.id ? 'Connecting...' : `Connect to ${connector.name}`}
                </button>
              ))}
              {connectError && <p className="text-red-400 text-sm mt-2">Error: { connectError.message}</p>}
            </div>
          )}
        </div>
      </header>

      {isConnected && (
        <section className="w-full max-w-xl bg-slate-800/60 p-6 sm:p-8 rounded-xl shadow-2xl mb-12">
          <h2 className="text-3xl font-semibold mb-6 text-center text-pink-300">Create Your Token</h2>
          <div className="space-y-6">
            <div>
              <label htmlFor="tokenName" className="block text-sm font-medium text-slate-300 mb-1">Token Name (e.g., My Awesome Token)</label>
              <input
                type="text"
                id="tokenName"
                value={tokenName}
                onChange={(e) => setTokenName(e.target.value)}
                placeholder="My Awesome Token"
                className="w-full p-3 bg-slate-700 border border-slate-600 rounded-lg text-white placeholder-slate-400 focus:ring-2 focus:ring-purple-500 focus:border-purple-500 outline-none"
              />
            </div>
            <div>
              <label htmlFor="tokenSymbol" className="block text-sm font-medium text-slate-300 mb-1">Token Symbol (e.g., MAT)</label>
              <input
                type="text"
                id="tokenSymbol"
                value={tokenSymbol}
                onChange={(e) => setTokenSymbol(e.target.value)}
                placeholder="MAT"
                className="w-full p-3 bg-slate-700 border border-slate-600 rounded-lg text-white placeholder-slate-400 focus:ring-2 focus:ring-purple-500 focus:border-purple-500 outline-none"
              />
            </div>
            <div>
              <label htmlFor="tokenDecimals" className="block text-sm font-medium text-slate-300 mb-1">Token Decimals (0-18, default: 18)</label>
              <input
                type="number"
                id="tokenDecimals"
                value={tokenDecimals}
                onChange={(e) => setTokenDecimals(e.target.value === '' ? '' : parseInt(e.target.value, 10))}
                placeholder="18"
                min="0"
                max="18"
                className="w-full p-3 bg-slate-700 border border-slate-600 rounded-lg text-white placeholder-slate-400 focus:ring-2 focus:ring-purple-500 focus:border-purple-500 outline-none"
              />
            </div>
            <button
              onClick={handleLaunchToken}
              disabled={isLaunching || !tokenName.trim() || !tokenSymbol.trim() || tokenDecimals === ''}
              className="w-full px-10 py-4 bg-gradient-to-r from-pink-500 to-red-500 hover:from-pink-600 hover:to-red-600 rounded-lg font-bold text-xl transition-all shadow-xl disabled:opacity-60 disabled:cursor-not-allowed flex items-center justify-center"
            >
              {isLaunching ? (
                <>
                  <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  Launching...
                </>
              ) : (
                'Launch Your Token Now'
              )}
            </button>
          </div>
        </section>
      )}

      <main className="w-full max-w-4xl space-y-10">
        <section className="bg-slate-800/50 p-6 sm:p-8 rounded-xl shadow-2xl">
          <h2 className="text-3xl font-semibold mb-4 text-purple-300">Why Launch With Us? The eERC Advantage</h2>
          <p className="text-lg text-slate-300 leading-relaxed mb-6">
            We use the cutting-edge <strong className="font-semibold text-purple-200">Encrypted ERC-20 (eERC)</strong> protocol on Avalanche. This means your token benefits from powerful privacy features, making transactions secure and confidential right from the start.
          </p>
          <div className="grid md:grid-cols-2 gap-6">
            {[{
              title: "True Financial Privacy",
              description: "Keep token balances and transaction details hidden. Your financial activity stays yours."
            }, {
              title: "You're Always in Control",
              description: "All encryption and decryption happen on your device. You hold the keys to your privacy."
            }, {
              title: "Simple, On-Chain Security",
              description: "No complex off-chain systems. Everything is secured directly on the Avalanche blockchain."
            }, {
              title: "Built for Modern Needs",
              description: "Handles large amounts and can be used to create new private tokens or add privacy to existing ones."
            }].map(feature => (
              <div key={feature.title} className="p-5 bg-slate-700/50 rounded-lg">
                <h3 className="font-semibold text-xl text-pink-200 mb-1">{feature.title}</h3>
                <p className="text-slate-400 text-md leading-normal">{feature.description}</p>
              </div>
            ))}
          </div>
        </section>

        {!isConnected && (
           <section className="text-center p-6">
            <p className="text-lg text-slate-400">Connect your wallet to begin creating your own secure and private token.</p>
          </section>
        )}
      </main>

      <footer className="w-full max-w-4xl mt-12 pt-8 border-t border-slate-700 text-center">
        <p className="text-slate-400">
          Experience the future of private and secure tokenization.
        </p>
        <p className="text-sm text-slate-500 mt-2">
          Powered by the <a href="https://docs.avax.network/" target="_blank" rel="noopener noreferrer" className="text-purple-400 hover:underline">Encrypted ERC-20 Protocol</a> on Avalanche.
        </p>
      </footer>
    </div>
  );
}