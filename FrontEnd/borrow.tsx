import React, { useState } from 'react';
import { useContract } from '../hooks/useContract';
import { ethers } from 'ethers';

const Borrow: React.FC = () => {
  const [amount, setAmount] = useState('');
  const [collateralAmount, setCollateralAmount] = useState('');
  const lendingPool = useContract('LendingPool');
  const token = useContract('Token');

  const handleBorrow = async () => {
    if (!lendingPool || !token) return;

    try {
      const amountToBorrow = ethers.utils.parseUnits(amount, 18);
      const collateralAmountToUse = ethers.utils.parseUnits(collateralAmount, 18);

      await token.approve(lendingPool.address, collateralAmountToUse);
      const tx = await lendingPool.borrow(token.address, amountToBorrow, token.address, collateralAmountToUse);
      await tx.wait();
      alert('Borrowed successfully');
    } catch (error) {
      console.error(error);
      alert('Borrowing failed');
    }
  };

  return (
    <div>
      <input type="number" value={amount} onChange={(e) => setAmount(e.target.value)} placeholder="Amount to borrow" />
      <input type="number" value={collateralAmount} onChange={(e) => setCollateralAmount(e.target.value)} placeholder="Collateral amount" />
      <button onClick={handleBorrow}>Borrow</button>
    </div>
  );
};

export default Borrow;
