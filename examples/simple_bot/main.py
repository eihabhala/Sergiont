# Simple Trading Bot Example
import json
import time

class SimpleBot:
    def __init__(self, config_path):
        with open(config_path, 'r') as f:
            self.config = json.load(f)
        
        self.name = self.config['name']
        self.symbol = self.config.get('symbol', 'BTC/USD')
        self.timeframe = self.config.get('timeframe', '1h')
        
    def run(self):
        print(f"Starting {self.name}")
        print(f"Trading symbol: {self.symbol}")
        print(f"Timeframe: {self.timeframe}")
        
        # Main trading loop
        while True:
            # In a real bot, this would:
            # 1. Fetch market data
            # 2. Analyze the data
            # 3. Make trading decisions
            # 4. Execute trades
            
            print(f"{self.name} running... (simulated)")
            time.sleep(10)  # Wait 10 seconds before next iteration

if __name__ == "__main__":
    bot = SimpleBot('config.json')
    bot.run()