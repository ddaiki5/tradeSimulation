class GeneticAlgorithm{
  private int productNum = 3;
  private int merchantNum;
  private MerchantManager mManager;
  public GeneticAlgorithm(int mNum){
    merchantNum = mNum;
    mManager = new MerchantManager(mNum, productNum, 0.5);
  }
  
}
