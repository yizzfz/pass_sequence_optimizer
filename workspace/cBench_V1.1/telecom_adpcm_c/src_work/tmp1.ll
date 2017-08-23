; ModuleID = 'adpcm.ll'
source_filename = "adpcm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@stepsizeTable = internal global [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal global [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16

; Function Attrs: nounwind uwtable
define void @adpcm_coder(i16*, i8*, i32, %struct.adpcm_state*) #0 {
  %5 = alloca i16*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.adpcm_state*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store i16* %0, i16** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store %struct.adpcm_state* %3, %struct.adpcm_state** %8, align 8
  store i32 0, i32* %19, align 4
  %21 = load i8*, i8** %6, align 8
  store i8* %21, i8** %10, align 8
  %22 = load i16*, i16** %5, align 8
  store i16* %22, i16** %9, align 8
  %23 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %24 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %23, i32 0, i32 0
  %25 = load i16, i16* %24, align 2
  %26 = sext i16 %25 to i32
  store i32 %26, i32* %16, align 4
  %27 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %28 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %27, i32 0, i32 1
  %29 = load i8, i8* %28, align 2
  %30 = sext i8 %29 to i32
  store i32 %30, i32* %18, align 4
  %31 = load i32, i32* %18, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %32
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %15, align 4
  store i32 1, i32* %20, align 4
  br label %35

; <label>:35:                                     ; preds = %155, %4
  %36 = load i32, i32* %7, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %158

; <label>:38:                                     ; preds = %35
  %39 = load i16*, i16** %9, align 8
  %40 = getelementptr inbounds i16, i16* %39, i32 1
  store i16* %40, i16** %9, align 8
  %41 = load i16, i16* %39, align 2
  %42 = sext i16 %41 to i32
  store i32 %42, i32* %11, align 4
  %43 = load i32, i32* %11, align 4
  %44 = load i32, i32* %16, align 4
  %45 = sub nsw i32 %43, %44
  store i32 %45, i32* %14, align 4
  %46 = load i32, i32* %14, align 4
  %47 = icmp slt i32 %46, 0
  %48 = select i1 %47, i32 8, i32 0
  store i32 %48, i32* %12, align 4
  %49 = load i32, i32* %12, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %54

; <label>:51:                                     ; preds = %38
  %52 = load i32, i32* %14, align 4
  %53 = sub nsw i32 0, %52
  store i32 %53, i32* %14, align 4
  br label %54

; <label>:54:                                     ; preds = %51, %38
  store i32 0, i32* %13, align 4
  %55 = load i32, i32* %15, align 4
  %56 = ashr i32 %55, 3
  store i32 %56, i32* %17, align 4
  %57 = load i32, i32* %14, align 4
  %58 = load i32, i32* %15, align 4
  %59 = icmp sge i32 %57, %58
  br i1 %59, label %60, label %67

; <label>:60:                                     ; preds = %54
  store i32 4, i32* %13, align 4
  %61 = load i32, i32* %15, align 4
  %62 = load i32, i32* %14, align 4
  %63 = sub nsw i32 %62, %61
  store i32 %63, i32* %14, align 4
  %64 = load i32, i32* %15, align 4
  %65 = load i32, i32* %17, align 4
  %66 = add nsw i32 %65, %64
  store i32 %66, i32* %17, align 4
  br label %67

; <label>:67:                                     ; preds = %60, %54
  %68 = load i32, i32* %15, align 4
  %69 = ashr i32 %68, 1
  store i32 %69, i32* %15, align 4
  %70 = load i32, i32* %14, align 4
  %71 = load i32, i32* %15, align 4
  %72 = icmp sge i32 %70, %71
  br i1 %72, label %73, label %82

; <label>:73:                                     ; preds = %67
  %74 = load i32, i32* %13, align 4
  %75 = or i32 %74, 2
  store i32 %75, i32* %13, align 4
  %76 = load i32, i32* %15, align 4
  %77 = load i32, i32* %14, align 4
  %78 = sub nsw i32 %77, %76
  store i32 %78, i32* %14, align 4
  %79 = load i32, i32* %15, align 4
  %80 = load i32, i32* %17, align 4
  %81 = add nsw i32 %80, %79
  store i32 %81, i32* %17, align 4
  br label %82

; <label>:82:                                     ; preds = %73, %67
  %83 = load i32, i32* %15, align 4
  %84 = ashr i32 %83, 1
  store i32 %84, i32* %15, align 4
  %85 = load i32, i32* %14, align 4
  %86 = load i32, i32* %15, align 4
  %87 = icmp sge i32 %85, %86
  br i1 %87, label %88, label %94

; <label>:88:                                     ; preds = %82
  %89 = load i32, i32* %13, align 4
  %90 = or i32 %89, 1
  store i32 %90, i32* %13, align 4
  %91 = load i32, i32* %15, align 4
  %92 = load i32, i32* %17, align 4
  %93 = add nsw i32 %92, %91
  store i32 %93, i32* %17, align 4
  br label %94

; <label>:94:                                     ; preds = %88, %82
  %95 = load i32, i32* %12, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %101

; <label>:97:                                     ; preds = %94
  %98 = load i32, i32* %17, align 4
  %99 = load i32, i32* %16, align 4
  %100 = sub nsw i32 %99, %98
  store i32 %100, i32* %16, align 4
  br label %105

; <label>:101:                                    ; preds = %94
  %102 = load i32, i32* %17, align 4
  %103 = load i32, i32* %16, align 4
  %104 = add nsw i32 %103, %102
  store i32 %104, i32* %16, align 4
  br label %105

; <label>:105:                                    ; preds = %101, %97
  %106 = load i32, i32* %16, align 4
  %107 = icmp sgt i32 %106, 32767
  br i1 %107, label %108, label %109

; <label>:108:                                    ; preds = %105
  store i32 32767, i32* %16, align 4
  br label %114

; <label>:109:                                    ; preds = %105
  %110 = load i32, i32* %16, align 4
  %111 = icmp slt i32 %110, -32768
  br i1 %111, label %112, label %113

; <label>:112:                                    ; preds = %109
  store i32 -32768, i32* %16, align 4
  br label %113

; <label>:113:                                    ; preds = %112, %109
  br label %114

; <label>:114:                                    ; preds = %113, %108
  %115 = load i32, i32* %12, align 4
  %116 = load i32, i32* %13, align 4
  %117 = or i32 %116, %115
  store i32 %117, i32* %13, align 4
  %118 = load i32, i32* %13, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %119
  %121 = load i32, i32* %120, align 4
  %122 = load i32, i32* %18, align 4
  %123 = add nsw i32 %122, %121
  store i32 %123, i32* %18, align 4
  %124 = load i32, i32* %18, align 4
  %125 = icmp slt i32 %124, 0
  br i1 %125, label %126, label %127

; <label>:126:                                    ; preds = %114
  store i32 0, i32* %18, align 4
  br label %127

; <label>:127:                                    ; preds = %126, %114
  %128 = load i32, i32* %18, align 4
  %129 = icmp sgt i32 %128, 88
  br i1 %129, label %130, label %131

; <label>:130:                                    ; preds = %127
  store i32 88, i32* %18, align 4
  br label %131

; <label>:131:                                    ; preds = %130, %127
  %132 = load i32, i32* %18, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %133
  %135 = load i32, i32* %134, align 4
  store i32 %135, i32* %15, align 4
  %136 = load i32, i32* %20, align 4
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %138, label %142

; <label>:138:                                    ; preds = %131
  %139 = load i32, i32* %13, align 4
  %140 = shl i32 %139, 4
  %141 = and i32 %140, 240
  store i32 %141, i32* %19, align 4
  br label %150

; <label>:142:                                    ; preds = %131
  %143 = load i32, i32* %13, align 4
  %144 = and i32 %143, 15
  %145 = load i32, i32* %19, align 4
  %146 = or i32 %144, %145
  %147 = trunc i32 %146 to i8
  %148 = load i8*, i8** %10, align 8
  %149 = getelementptr inbounds i8, i8* %148, i32 1
  store i8* %149, i8** %10, align 8
  store i8 %147, i8* %148, align 1
  br label %150

; <label>:150:                                    ; preds = %142, %138
  %151 = load i32, i32* %20, align 4
  %152 = icmp ne i32 %151, 0
  %153 = xor i1 %152, true
  %154 = zext i1 %153 to i32
  store i32 %154, i32* %20, align 4
  br label %155

; <label>:155:                                    ; preds = %150
  %156 = load i32, i32* %7, align 4
  %157 = add nsw i32 %156, -1
  store i32 %157, i32* %7, align 4
  br label %35

; <label>:158:                                    ; preds = %35
  %159 = load i32, i32* %20, align 4
  %160 = icmp ne i32 %159, 0
  br i1 %160, label %166, label %161

; <label>:161:                                    ; preds = %158
  %162 = load i32, i32* %19, align 4
  %163 = trunc i32 %162 to i8
  %164 = load i8*, i8** %10, align 8
  %165 = getelementptr inbounds i8, i8* %164, i32 1
  store i8* %165, i8** %10, align 8
  store i8 %163, i8* %164, align 1
  br label %166

; <label>:166:                                    ; preds = %161, %158
  %167 = load i32, i32* %16, align 4
  %168 = trunc i32 %167 to i16
  %169 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %170 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %169, i32 0, i32 0
  store i16 %168, i16* %170, align 2
  %171 = load i32, i32* %18, align 4
  %172 = trunc i32 %171 to i8
  %173 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %174 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %173, i32 0, i32 1
  store i8 %172, i8* %174, align 2
  ret void
}

; Function Attrs: nounwind uwtable
define void @adpcm_decoder(i8*, i16*, i32, %struct.adpcm_state*) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.adpcm_state*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i16* %1, i16** %6, align 8
  store i32 %2, i32* %7, align 4
  store %struct.adpcm_state* %3, %struct.adpcm_state** %8, align 8
  store i32 0, i32* %17, align 4
  %19 = load i16*, i16** %6, align 8
  store i16* %19, i16** %10, align 8
  %20 = load i8*, i8** %5, align 8
  store i8* %20, i8** %9, align 8
  %21 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %22 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %21, i32 0, i32 0
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  store i32 %24, i32* %14, align 4
  %25 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %26 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %25, i32 0, i32 1
  %27 = load i8, i8* %26, align 2
  %28 = sext i8 %27 to i32
  store i32 %28, i32* %16, align 4
  %29 = load i32, i32* %16, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %30
  %32 = load i32, i32* %31, align 4
  store i32 %32, i32* %13, align 4
  store i32 0, i32* %18, align 4
  br label %33

; <label>:33:                                     ; preds = %129, %4
  %34 = load i32, i32* %7, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %132

; <label>:36:                                     ; preds = %33
  %37 = load i32, i32* %18, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %36
  %40 = load i32, i32* %17, align 4
  %41 = and i32 %40, 15
  store i32 %41, i32* %12, align 4
  br label %50

; <label>:42:                                     ; preds = %36
  %43 = load i8*, i8** %9, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %9, align 8
  %45 = load i8, i8* %43, align 1
  %46 = sext i8 %45 to i32
  store i32 %46, i32* %17, align 4
  %47 = load i32, i32* %17, align 4
  %48 = ashr i32 %47, 4
  %49 = and i32 %48, 15
  store i32 %49, i32* %12, align 4
  br label %50

; <label>:50:                                     ; preds = %42, %39
  %51 = load i32, i32* %18, align 4
  %52 = icmp ne i32 %51, 0
  %53 = xor i1 %52, true
  %54 = zext i1 %53 to i32
  store i32 %54, i32* %18, align 4
  %55 = load i32, i32* %12, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = load i32, i32* %16, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, i32* %16, align 4
  %61 = load i32, i32* %16, align 4
  %62 = icmp slt i32 %61, 0
  br i1 %62, label %63, label %64

; <label>:63:                                     ; preds = %50
  store i32 0, i32* %16, align 4
  br label %64

; <label>:64:                                     ; preds = %63, %50
  %65 = load i32, i32* %16, align 4
  %66 = icmp sgt i32 %65, 88
  br i1 %66, label %67, label %68

; <label>:67:                                     ; preds = %64
  store i32 88, i32* %16, align 4
  br label %68

; <label>:68:                                     ; preds = %67, %64
  %69 = load i32, i32* %12, align 4
  %70 = and i32 %69, 8
  store i32 %70, i32* %11, align 4
  %71 = load i32, i32* %12, align 4
  %72 = and i32 %71, 7
  store i32 %72, i32* %12, align 4
  %73 = load i32, i32* %13, align 4
  %74 = ashr i32 %73, 3
  store i32 %74, i32* %15, align 4
  %75 = load i32, i32* %12, align 4
  %76 = and i32 %75, 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %82

; <label>:78:                                     ; preds = %68
  %79 = load i32, i32* %13, align 4
  %80 = load i32, i32* %15, align 4
  %81 = add nsw i32 %80, %79
  store i32 %81, i32* %15, align 4
  br label %82

; <label>:82:                                     ; preds = %78, %68
  %83 = load i32, i32* %12, align 4
  %84 = and i32 %83, 2
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %91

; <label>:86:                                     ; preds = %82
  %87 = load i32, i32* %13, align 4
  %88 = ashr i32 %87, 1
  %89 = load i32, i32* %15, align 4
  %90 = add nsw i32 %89, %88
  store i32 %90, i32* %15, align 4
  br label %91

; <label>:91:                                     ; preds = %86, %82
  %92 = load i32, i32* %12, align 4
  %93 = and i32 %92, 1
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %100

; <label>:95:                                     ; preds = %91
  %96 = load i32, i32* %13, align 4
  %97 = ashr i32 %96, 2
  %98 = load i32, i32* %15, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, i32* %15, align 4
  br label %100

; <label>:100:                                    ; preds = %95, %91
  %101 = load i32, i32* %11, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %107

; <label>:103:                                    ; preds = %100
  %104 = load i32, i32* %15, align 4
  %105 = load i32, i32* %14, align 4
  %106 = sub nsw i32 %105, %104
  store i32 %106, i32* %14, align 4
  br label %111

; <label>:107:                                    ; preds = %100
  %108 = load i32, i32* %15, align 4
  %109 = load i32, i32* %14, align 4
  %110 = add nsw i32 %109, %108
  store i32 %110, i32* %14, align 4
  br label %111

; <label>:111:                                    ; preds = %107, %103
  %112 = load i32, i32* %14, align 4
  %113 = icmp sgt i32 %112, 32767
  br i1 %113, label %114, label %115

; <label>:114:                                    ; preds = %111
  store i32 32767, i32* %14, align 4
  br label %120

; <label>:115:                                    ; preds = %111
  %116 = load i32, i32* %14, align 4
  %117 = icmp slt i32 %116, -32768
  br i1 %117, label %118, label %119

; <label>:118:                                    ; preds = %115
  store i32 -32768, i32* %14, align 4
  br label %119

; <label>:119:                                    ; preds = %118, %115
  br label %120

; <label>:120:                                    ; preds = %119, %114
  %121 = load i32, i32* %16, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %122
  %124 = load i32, i32* %123, align 4
  store i32 %124, i32* %13, align 4
  %125 = load i32, i32* %14, align 4
  %126 = trunc i32 %125 to i16
  %127 = load i16*, i16** %10, align 8
  %128 = getelementptr inbounds i16, i16* %127, i32 1
  store i16* %128, i16** %10, align 8
  store i16 %126, i16* %127, align 2
  br label %129

; <label>:129:                                    ; preds = %120
  %130 = load i32, i32* %7, align 4
  %131 = add nsw i32 %130, -1
  store i32 %131, i32* %7, align 4
  br label %33

; <label>:132:                                    ; preds = %33
  %133 = load i32, i32* %14, align 4
  %134 = trunc i32 %133 to i16
  %135 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %136 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %135, i32 0, i32 0
  store i16 %134, i16* %136, align 2
  %137 = load i32, i32* %16, align 4
  %138 = trunc i32 %137 to i8
  %139 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %140 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %139, i32 0, i32 1
  store i8 %138, i8* %140, align 2
  ret void
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
