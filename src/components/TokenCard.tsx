
// import { useReadContract } from 'wagmi';
// import abi from "../abi/launchtk.json";

// Remove ContractAddress constant as it's not needed here anymore

interface TokenDetails {
  name: string;
  symbol: string;
  decimals: number; // ABI shows uint8, which is a number in TS
  tokenAddress: `0x${string}`;
}

interface TokenCardProps {
  tokenDetail: TokenDetails; // Changed from tokenAddress to tokenDetail
}

// Interface TokenDetailsFromContract is no longer needed as we get the full object

export function TokenCard({ tokenDetail }: TokenCardProps) {
  // Remove the useReadContract hook as details are passed directly

  // isLoading, error, and !tokenDetails checks can be simplified or removed
  // as we assume tokenDetail is provided and valid if this component renders.
  // However, for robustness, a check for tokenDetail might still be good.

  if (!tokenDetail) {
    return (
      <div className="bg-slate-800/60 rounded-xl shadow-lg p-6">
        <p className="text-slate-400">Token details are missing.</p>
      </div>
    );
  }

  // Use tokenDetail directly
  const details = tokenDetail;

  return (
    <div className="bg-slate-800/60 rounded-xl shadow-2xl p-6 hover:shadow-purple-500/30 transition-all duration-300 ease-in-out transform hover:-translate-y-1 flex flex-col">
      <div className="flex items-center mb-4">
        <div className="w-16 h-16 rounded-full mr-4 border-2 border-slate-700 bg-slate-700 flex items-center justify-center text-2xl font-bold text-sky-300">
          {details.symbol ? details.symbol.substring(0, 1) : '?'}
        </div>
        <div>
          <h2 className="text-2xl font-semibold text-sky-300 truncate" title={details.name}>{details.name} ({details.symbol})</h2>
          <p className="text-xs text-slate-400">Decimals: {details.decimals.toString()}</p>
        </div>
      </div>
      <p className="text-slate-300 leading-relaxed mb-4 text-sm flex-grow">
        Token Address: <span className="font-mono text-purple-300 break-all">{details.tokenAddress}</span>
      </p>
      {/* Future: Add more details or actions here */}
    </div>
  );
}