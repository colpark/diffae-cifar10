#!/bin/bash

# DiffAE CIFAR-10 - GitHub Push Script
# ======================================

echo "🚀 DiffAE CIFAR-10 GitHub Setup"
echo "================================"
echo ""

# Check if we're in the right directory
if [ ! -f "diffae_cifar10.ipynb" ]; then
    echo "❌ Error: Please run this script from the diffae-cifar10 directory"
    echo "   cd /Users/davidpark/Documents/Claude/diffae-cifar10"
    exit 1
fi

echo "📂 Current directory: $(pwd)"
echo ""

# Check git status
echo "📊 Git Status:"
git status --short
echo ""

# Check if remote exists
if git remote get-url origin &> /dev/null; then
    echo "✅ Remote configured: $(git remote get-url origin)"
else
    echo "⚠️  Setting up remote..."
    git remote add origin https://github.com/colpark/diffae-cifar10.git
    echo "✅ Remote added: https://github.com/colpark/diffae-cifar10.git"
fi
echo ""

# Instructions
echo "📋 Next Steps:"
echo "=============="
echo ""
echo "1. Create GitHub repository (if not created yet):"
echo "   → Open: https://github.com/new"
echo "   → Repository name: diffae-cifar10"
echo "   → Description: Diffusion Autoencoders implementation on CIFAR-10"
echo "   → Public repository"
echo "   → DO NOT initialize with README"
echo ""
echo "2. Push to GitHub:"
echo "   → Run: git push -u origin main"
echo ""
echo "3. Verify:"
echo "   → Check: https://github.com/colpark/diffae-cifar10"
echo ""

# Try to push
read -p "🤔 Have you created the repository on GitHub? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "📤 Pushing to GitHub..."
    git push -u origin main

    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ SUCCESS! Repository pushed to GitHub"
        echo "🌐 View at: https://github.com/colpark/diffae-cifar10"
        echo ""
        echo "📝 What's included:"
        echo "   ✓ Complete DiffAE implementation (diffae_cifar10.ipynb)"
        echo "   ✓ Comprehensive README with examples"
        echo "   ✓ Architecture documentation (docs/architecture.md)"
        echo "   ✓ Integration guide (docs/integration.md)"
        echo "   ✓ Clean .gitignore for checkpoints and data"
        echo ""
    else
        echo ""
        echo "❌ Push failed. Repository might not exist yet."
        echo "   Please create it at: https://github.com/new"
        echo "   Then run this script again."
    fi
else
    echo ""
    echo "⏸️  No problem! Create the repository first:"
    echo "   1. Go to: https://github.com/new"
    echo "   2. Name: diffae-cifar10"
    echo "   3. Public, no README"
    echo "   4. Run this script again"
    echo ""
fi
