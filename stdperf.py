import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# ── Load Data ──────────────────────────────────────────────────────────────────
df = pd.read_csv('StudentsPerformance.csv')
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_').str.replace('/', '_')

print("Dataset loaded:", df.shape)
print(df.head())

# ── Basic Stats ────────────────────────────────────────────────────────────────
print("\nAverage Scores:")
print(df[['math_score', 'reading_score', 'writing_score']].mean().round(2))

# ── Plot 1: Average Scores by Gender ──────────────────────────────────────────
gender_avg = df.groupby('gender')[['math_score', 'reading_score', 'writing_score']].mean()
gender_avg.plot(kind='bar', figsize=(8, 5), color=['steelblue', 'salmon', 'mediumseagreen'])
plt.title('Average Scores by Gender')
plt.ylabel('Average Score')
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig('plot_gender.png')
plt.show()
print("Saved: plot_gender.png")

# ── Plot 2: Test Preparation Impact ───────────────────────────────────────────
test_avg = df.groupby('test_preparation_course')[['math_score', 'reading_score', 'writing_score']].mean()
test_avg.plot(kind='bar', figsize=(8, 5), color=['steelblue', 'salmon', 'mediumseagreen'])
plt.title('Impact of Test Preparation on Scores')
plt.ylabel('Average Score')
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig('plot_test_prep.png')
plt.show()
print("Saved: plot_test_prep.png")

# ── Plot 3: Score Distribution (Histogram) ────────────────────────────────────
df[['math_score', 'reading_score', 'writing_score']].hist(bins=20, figsize=(12, 4), color='steelblue', edgecolor='white')
plt.suptitle('Score Distributions')
plt.tight_layout()
plt.savefig('plot_distributions.png')
plt.show()
print("Saved: plot_distributions.png")

# ── Plot 4: Correlation Heatmap ───────────────────────────────────────────────
plt.figure(figsize=(6, 4))
sns.heatmap(df[['math_score', 'reading_score', 'writing_score']].corr(),
            annot=True, cmap='coolwarm', fmt='.2f')
plt.title('Score Correlation Heatmap')
plt.tight_layout()
plt.savefig('plot_correlation.png')
plt.show()
print("Saved: plot_correlation.png")

print("\nDone! All plots saved.")