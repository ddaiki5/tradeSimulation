//染色体の抽象化クラス
abstract class Chromosome{
  public Chromosome(){};
  
  //初期化
  abstract protected void init();
  
  //目的関数
  abstract public float getFitness();
  
  //
  abstract public void makeRandomInstance();
  
  abstract public void mutate();
  
  //abstract public Chromosome[] execCrossover(Chromosome other);
  
}

class Merchant extends Chromosome{
  protected int prices[];
  protected int productNum;
  protected int profits;
  protected float mutateRate;
  
  public Merchant(int productNum, float mutateRate, boolean initFlag){
    super(); 
    this.productNum = productNum;
    this.mutateRate = mutateRate;
    this.prices = new int[productNum];
    if(initFlag){
      makeRandomInstance();
    }
  }
  
  protected void init(){
  
  }
  
  //目的関数
  public float getFitness(){
    return profits;
  }
  
  //
  public void makeRandomInstance(){
    for(int i=0;i<productNum;i++){
      prices[i] = int(random(1, 1000));
    }
  }
  
  public void mutate(){
    for(int i=0;i<productNum; i++){
      if(random(100)<mutateRate){
        prices[i] = int(random(1, 1000));
      }
    }
  }
  
  public Merchant execCrossover(Merchant other){  
    Merchant tmp = new Merchant(productNum, mutateRate, false);
    for(int i=0;i<productNum;i++){
      if(int(random(0, 2))>1){
        tmp.prices[i] = this.prices[i];
      }else{
        tmp.prices[i] = other.prices[i];
      }
    }    
    return tmp;
  }  
}

class MerchantManager{
  private Merchant[] merchants;
  private int productNum; 
  public MerchantManager(int maxMerchants,int productNum, float mutateRate){
    merchants = new Merchant[maxMerchants];
    for(int i=0; i<maxMerchants;i++){
      merchants[i] = new Merchant(productNum, mutateRate, true);
    }
    this.productNum = productNum;
  }
}
