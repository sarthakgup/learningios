class LifeformAnalyzer
{
    func processLifeform(text: String) -> String
    {
        return text.lowercased().contains("quack") ? "duck" : "human"
    }
}
