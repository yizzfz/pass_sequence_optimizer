; ModuleID = 'strtol.ll'
source_filename = "strtol.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i64 @strtol(i8*, i8**, i32) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8** %1, i8*** %5, align 8
  store i32 %2, i32* %6, align 4
  %14 = load i8*, i8** %4, align 8
  store i8* %14, i8** %7, align 8
  store i32 0, i32* %11, align 4
  br label %15

; <label>:15:                                     ; preds = %20, %3
  %16 = load i8*, i8** %7, align 8
  %17 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %17, i8** %7, align 8
  %18 = load i8, i8* %16, align 1
  %19 = sext i8 %18 to i32
  store i32 %19, i32* %9, align 4
  br label %20

; <label>:20:                                     ; preds = %15
  %21 = call i16** @__ctype_b_loc() #2
  %22 = load i16*, i16** %21, align 8
  %23 = load i32, i32* %9, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i16, i16* %22, i64 %24
  %26 = load i16, i16* %25, align 2
  %27 = zext i16 %26 to i32
  %28 = and i32 %27, 8192
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %15, label %30

; <label>:30:                                     ; preds = %20
  %31 = load i32, i32* %9, align 4
  %32 = icmp eq i32 %31, 45
  br i1 %32, label %33, label %38

; <label>:33:                                     ; preds = %30
  store i32 1, i32* %11, align 4
  %34 = load i8*, i8** %7, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %35, i8** %7, align 8
  %36 = load i8, i8* %34, align 1
  %37 = sext i8 %36 to i32
  store i32 %37, i32* %9, align 4
  br label %47

; <label>:38:                                     ; preds = %30
  %39 = load i32, i32* %9, align 4
  %40 = icmp eq i32 %39, 43
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %38
  %42 = load i8*, i8** %7, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %7, align 8
  %44 = load i8, i8* %42, align 1
  %45 = sext i8 %44 to i32
  store i32 %45, i32* %9, align 4
  br label %46

; <label>:46:                                     ; preds = %41, %38
  br label %47

; <label>:47:                                     ; preds = %46, %33
  %48 = load i32, i32* %6, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %53, label %50

; <label>:50:                                     ; preds = %47
  %51 = load i32, i32* %6, align 4
  %52 = icmp eq i32 %51, 16
  br i1 %52, label %53, label %73

; <label>:53:                                     ; preds = %50, %47
  %54 = load i32, i32* %9, align 4
  %55 = icmp eq i32 %54, 48
  br i1 %55, label %56, label %73

; <label>:56:                                     ; preds = %53
  %57 = load i8*, i8** %7, align 8
  %58 = load i8, i8* %57, align 1
  %59 = sext i8 %58 to i32
  %60 = icmp eq i32 %59, 120
  br i1 %60, label %66, label %61

; <label>:61:                                     ; preds = %56
  %62 = load i8*, i8** %7, align 8
  %63 = load i8, i8* %62, align 1
  %64 = sext i8 %63 to i32
  %65 = icmp eq i32 %64, 88
  br i1 %65, label %66, label %73

; <label>:66:                                     ; preds = %61, %56
  %67 = load i8*, i8** %7, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 1
  %69 = load i8, i8* %68, align 1
  %70 = sext i8 %69 to i32
  store i32 %70, i32* %9, align 4
  %71 = load i8*, i8** %7, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 2
  store i8* %72, i8** %7, align 8
  store i32 16, i32* %6, align 4
  br label %73

; <label>:73:                                     ; preds = %66, %61, %53, %50
  %74 = load i32, i32* %6, align 4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %80

; <label>:76:                                     ; preds = %73
  %77 = load i32, i32* %9, align 4
  %78 = icmp eq i32 %77, 48
  %79 = select i1 %78, i32 8, i32 10
  store i32 %79, i32* %6, align 4
  br label %80

; <label>:80:                                     ; preds = %76, %73
  %81 = load i32, i32* %11, align 4
  %82 = icmp ne i32 %81, 0
  %83 = select i1 %82, i64 -9223372036854775808, i64 9223372036854775807
  store i64 %83, i64* %10, align 8
  %84 = load i64, i64* %10, align 8
  %85 = load i32, i32* %6, align 4
  %86 = sext i32 %85 to i64
  %87 = urem i64 %84, %86
  %88 = trunc i64 %87 to i32
  store i32 %88, i32* %13, align 4
  %89 = load i32, i32* %6, align 4
  %90 = sext i32 %89 to i64
  %91 = load i64, i64* %10, align 8
  %92 = udiv i64 %91, %90
  store i64 %92, i64* %10, align 8
  store i64 0, i64* %8, align 8
  store i32 0, i32* %12, align 4
  br label %93

; <label>:93:                                     ; preds = %162, %80
  %94 = call i16** @__ctype_b_loc() #2
  %95 = load i16*, i16** %94, align 8
  %96 = load i32, i32* %9, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i16, i16* %95, i64 %97
  %99 = load i16, i16* %98, align 2
  %100 = zext i16 %99 to i32
  %101 = and i32 %100, 2048
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %106

; <label>:103:                                    ; preds = %93
  %104 = load i32, i32* %9, align 4
  %105 = sub nsw i32 %104, 48
  store i32 %105, i32* %9, align 4
  br label %131

; <label>:106:                                    ; preds = %93
  %107 = call i16** @__ctype_b_loc() #2
  %108 = load i16*, i16** %107, align 8
  %109 = load i32, i32* %9, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i16, i16* %108, i64 %110
  %112 = load i16, i16* %111, align 2
  %113 = zext i16 %112 to i32
  %114 = and i32 %113, 1024
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %116, label %129

; <label>:116:                                    ; preds = %106
  %117 = call i16** @__ctype_b_loc() #2
  %118 = load i16*, i16** %117, align 8
  %119 = load i32, i32* %9, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i16, i16* %118, i64 %120
  %122 = load i16, i16* %121, align 2
  %123 = zext i16 %122 to i32
  %124 = and i32 %123, 256
  %125 = icmp ne i32 %124, 0
  %126 = select i1 %125, i32 55, i32 87
  %127 = load i32, i32* %9, align 4
  %128 = sub nsw i32 %127, %126
  store i32 %128, i32* %9, align 4
  br label %130

; <label>:129:                                    ; preds = %106
  br label %167

; <label>:130:                                    ; preds = %116
  br label %131

; <label>:131:                                    ; preds = %130, %103
  %132 = load i32, i32* %9, align 4
  %133 = load i32, i32* %6, align 4
  %134 = icmp sge i32 %132, %133
  br i1 %134, label %135, label %136

; <label>:135:                                    ; preds = %131
  br label %167

; <label>:136:                                    ; preds = %131
  %137 = load i32, i32* %12, align 4
  %138 = icmp slt i32 %137, 0
  br i1 %138, label %151, label %139

; <label>:139:                                    ; preds = %136
  %140 = load i64, i64* %8, align 8
  %141 = load i64, i64* %10, align 8
  %142 = icmp ugt i64 %140, %141
  br i1 %142, label %151, label %143

; <label>:143:                                    ; preds = %139
  %144 = load i64, i64* %8, align 8
  %145 = load i64, i64* %10, align 8
  %146 = icmp eq i64 %144, %145
  br i1 %146, label %147, label %152

; <label>:147:                                    ; preds = %143
  %148 = load i32, i32* %9, align 4
  %149 = load i32, i32* %13, align 4
  %150 = icmp sgt i32 %148, %149
  br i1 %150, label %151, label %152

; <label>:151:                                    ; preds = %147, %139, %136
  store i32 -1, i32* %12, align 4
  br label %161

; <label>:152:                                    ; preds = %147, %143
  store i32 1, i32* %12, align 4
  %153 = load i32, i32* %6, align 4
  %154 = sext i32 %153 to i64
  %155 = load i64, i64* %8, align 8
  %156 = mul i64 %155, %154
  store i64 %156, i64* %8, align 8
  %157 = load i32, i32* %9, align 4
  %158 = sext i32 %157 to i64
  %159 = load i64, i64* %8, align 8
  %160 = add i64 %159, %158
  store i64 %160, i64* %8, align 8
  br label %161

; <label>:161:                                    ; preds = %152, %151
  br label %162

; <label>:162:                                    ; preds = %161
  %163 = load i8*, i8** %7, align 8
  %164 = getelementptr inbounds i8, i8* %163, i32 1
  store i8* %164, i8** %7, align 8
  %165 = load i8, i8* %163, align 1
  %166 = sext i8 %165 to i32
  store i32 %166, i32* %9, align 4
  br label %93

; <label>:167:                                    ; preds = %135, %129
  %168 = load i32, i32* %12, align 4
  %169 = icmp slt i32 %168, 0
  br i1 %169, label %170, label %175

; <label>:170:                                    ; preds = %167
  %171 = load i32, i32* %11, align 4
  %172 = icmp ne i32 %171, 0
  %173 = select i1 %172, i64 -9223372036854775808, i64 9223372036854775807
  store i64 %173, i64* %8, align 8
  %174 = call i32* @__errno_location() #2
  store i32 34, i32* %174, align 4
  br label %182

; <label>:175:                                    ; preds = %167
  %176 = load i32, i32* %11, align 4
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %181

; <label>:178:                                    ; preds = %175
  %179 = load i64, i64* %8, align 8
  %180 = sub i64 0, %179
  store i64 %180, i64* %8, align 8
  br label %181

; <label>:181:                                    ; preds = %178, %175
  br label %182

; <label>:182:                                    ; preds = %181, %170
  %183 = load i8**, i8*** %5, align 8
  %184 = icmp ne i8** %183, null
  br i1 %184, label %185, label %196

; <label>:185:                                    ; preds = %182
  %186 = load i32, i32* %12, align 4
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %188, label %191

; <label>:188:                                    ; preds = %185
  %189 = load i8*, i8** %7, align 8
  %190 = getelementptr inbounds i8, i8* %189, i64 -1
  br label %193

; <label>:191:                                    ; preds = %185
  %192 = load i8*, i8** %4, align 8
  br label %193

; <label>:193:                                    ; preds = %191, %188
  %194 = phi i8* [ %190, %188 ], [ %192, %191 ]
  %195 = load i8**, i8*** %5, align 8
  store i8* %194, i8** %195, align 8
  br label %196

; <label>:196:                                    ; preds = %193, %182
  %197 = load i64, i64* %8, align 8
  ret i64 %197
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
