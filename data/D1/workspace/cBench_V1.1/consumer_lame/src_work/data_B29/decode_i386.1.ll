; ModuleID = 'decode_i386.ll'
source_filename = "decode_i386.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mpstr = type { %struct.buf*, %struct.buf*, i32, i32, i32, %struct.frame, [2 x [2304 x i8]], [2 x [2 x [576 x double]]], [2 x i32], i64, i32, [2 x [2 x [272 x double]]], i32 }
%struct.buf = type { i8*, i64, i64, %struct.buf*, %struct.buf* }
%struct.frame = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }

@gmp = external local_unnamed_addr global %struct.mpstr*, align 8
@decwin = external global [544 x double], align 16

; Function Attrs: noinline nounwind uwtable
define i32 @synth_1to1_mono(double*, i8* nocapture, i32* nocapture) local_unnamed_addr #0 {
  %4 = alloca [64 x i16], align 16
  %5 = alloca i32, align 4
  store i32 0, i32* %5, align 4
  %6 = bitcast [64 x i16]* %4 to i8*
  %7 = call i32 @synth_1to1(double* %0, i32 0, i8* nonnull %6, i32* nonnull %5)
  %8 = load i32, i32* %2, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i8, i8* %1, i64 %9
  %11 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 0
  %12 = load i16, i16* %11, align 16
  %13 = bitcast i8* %10 to i16*
  store i16 %12, i16* %13, align 2
  %14 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 2
  %15 = getelementptr inbounds i8, i8* %10, i64 2
  %16 = load i16, i16* %14, align 4
  %17 = bitcast i8* %15 to i16*
  store i16 %16, i16* %17, align 2
  %18 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 4
  %19 = getelementptr inbounds i8, i8* %15, i64 2
  %20 = load i16, i16* %18, align 8
  %21 = bitcast i8* %19 to i16*
  store i16 %20, i16* %21, align 2
  %22 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 6
  %23 = getelementptr inbounds i8, i8* %19, i64 2
  %24 = load i16, i16* %22, align 4
  %25 = bitcast i8* %23 to i16*
  store i16 %24, i16* %25, align 2
  %26 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 8
  %27 = getelementptr inbounds i8, i8* %23, i64 2
  %28 = load i16, i16* %26, align 16
  %29 = bitcast i8* %27 to i16*
  store i16 %28, i16* %29, align 2
  %30 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 10
  %31 = getelementptr inbounds i8, i8* %27, i64 2
  %32 = load i16, i16* %30, align 4
  %33 = bitcast i8* %31 to i16*
  store i16 %32, i16* %33, align 2
  %34 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 12
  %35 = getelementptr inbounds i8, i8* %31, i64 2
  %36 = load i16, i16* %34, align 8
  %37 = bitcast i8* %35 to i16*
  store i16 %36, i16* %37, align 2
  %38 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 14
  %39 = getelementptr inbounds i8, i8* %35, i64 2
  %40 = load i16, i16* %38, align 4
  %41 = bitcast i8* %39 to i16*
  store i16 %40, i16* %41, align 2
  %42 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 16
  %43 = getelementptr inbounds i8, i8* %39, i64 2
  %44 = load i16, i16* %42, align 16
  %45 = bitcast i8* %43 to i16*
  store i16 %44, i16* %45, align 2
  %46 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 18
  %47 = getelementptr inbounds i8, i8* %43, i64 2
  %48 = load i16, i16* %46, align 4
  %49 = bitcast i8* %47 to i16*
  store i16 %48, i16* %49, align 2
  %50 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 20
  %51 = getelementptr inbounds i8, i8* %47, i64 2
  %52 = load i16, i16* %50, align 8
  %53 = bitcast i8* %51 to i16*
  store i16 %52, i16* %53, align 2
  %54 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 22
  %55 = getelementptr inbounds i8, i8* %51, i64 2
  %56 = load i16, i16* %54, align 4
  %57 = bitcast i8* %55 to i16*
  store i16 %56, i16* %57, align 2
  %58 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 24
  %59 = getelementptr inbounds i8, i8* %55, i64 2
  %60 = load i16, i16* %58, align 16
  %61 = bitcast i8* %59 to i16*
  store i16 %60, i16* %61, align 2
  %62 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 26
  %63 = getelementptr inbounds i8, i8* %59, i64 2
  %64 = load i16, i16* %62, align 4
  %65 = bitcast i8* %63 to i16*
  store i16 %64, i16* %65, align 2
  %66 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 28
  %67 = getelementptr inbounds i8, i8* %63, i64 2
  %68 = load i16, i16* %66, align 8
  %69 = bitcast i8* %67 to i16*
  store i16 %68, i16* %69, align 2
  %70 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 30
  %71 = getelementptr inbounds i8, i8* %67, i64 2
  %72 = load i16, i16* %70, align 4
  %73 = bitcast i8* %71 to i16*
  store i16 %72, i16* %73, align 2
  %74 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 32
  %75 = getelementptr inbounds i8, i8* %71, i64 2
  %76 = load i16, i16* %74, align 16
  %77 = bitcast i8* %75 to i16*
  store i16 %76, i16* %77, align 2
  %78 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 34
  %79 = getelementptr inbounds i8, i8* %75, i64 2
  %80 = load i16, i16* %78, align 4
  %81 = bitcast i8* %79 to i16*
  store i16 %80, i16* %81, align 2
  %82 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 36
  %83 = getelementptr inbounds i8, i8* %79, i64 2
  %84 = load i16, i16* %82, align 8
  %85 = bitcast i8* %83 to i16*
  store i16 %84, i16* %85, align 2
  %86 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 38
  %87 = getelementptr inbounds i8, i8* %83, i64 2
  %88 = load i16, i16* %86, align 4
  %89 = bitcast i8* %87 to i16*
  store i16 %88, i16* %89, align 2
  %90 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 40
  %91 = getelementptr inbounds i8, i8* %87, i64 2
  %92 = load i16, i16* %90, align 16
  %93 = bitcast i8* %91 to i16*
  store i16 %92, i16* %93, align 2
  %94 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 42
  %95 = getelementptr inbounds i8, i8* %91, i64 2
  %96 = load i16, i16* %94, align 4
  %97 = bitcast i8* %95 to i16*
  store i16 %96, i16* %97, align 2
  %98 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 44
  %99 = getelementptr inbounds i8, i8* %95, i64 2
  %100 = load i16, i16* %98, align 8
  %101 = bitcast i8* %99 to i16*
  store i16 %100, i16* %101, align 2
  %102 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 46
  %103 = getelementptr inbounds i8, i8* %99, i64 2
  %104 = load i16, i16* %102, align 4
  %105 = bitcast i8* %103 to i16*
  store i16 %104, i16* %105, align 2
  %106 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 48
  %107 = getelementptr inbounds i8, i8* %103, i64 2
  %108 = load i16, i16* %106, align 16
  %109 = bitcast i8* %107 to i16*
  store i16 %108, i16* %109, align 2
  %110 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 50
  %111 = getelementptr inbounds i8, i8* %107, i64 2
  %112 = load i16, i16* %110, align 4
  %113 = bitcast i8* %111 to i16*
  store i16 %112, i16* %113, align 2
  %114 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 52
  %115 = getelementptr inbounds i8, i8* %111, i64 2
  %116 = load i16, i16* %114, align 8
  %117 = bitcast i8* %115 to i16*
  store i16 %116, i16* %117, align 2
  %118 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 54
  %119 = getelementptr inbounds i8, i8* %115, i64 2
  %120 = load i16, i16* %118, align 4
  %121 = bitcast i8* %119 to i16*
  store i16 %120, i16* %121, align 2
  %122 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 56
  %123 = getelementptr inbounds i8, i8* %119, i64 2
  %124 = load i16, i16* %122, align 16
  %125 = bitcast i8* %123 to i16*
  store i16 %124, i16* %125, align 2
  %126 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 58
  %127 = getelementptr inbounds i8, i8* %123, i64 2
  %128 = load i16, i16* %126, align 4
  %129 = bitcast i8* %127 to i16*
  store i16 %128, i16* %129, align 2
  %130 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 60
  %131 = getelementptr inbounds i8, i8* %127, i64 2
  %132 = load i16, i16* %130, align 8
  %133 = bitcast i8* %131 to i16*
  store i16 %132, i16* %133, align 2
  %134 = getelementptr inbounds [64 x i16], [64 x i16]* %4, i64 0, i64 62
  %135 = getelementptr inbounds i8, i8* %131, i64 2
  %136 = load i16, i16* %134, align 4
  %137 = bitcast i8* %135 to i16*
  store i16 %136, i16* %137, align 2
  %138 = load i32, i32* %2, align 4
  %139 = add nsw i32 %138, 64
  store i32 %139, i32* %2, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @synth_1to1(double*, i32, i8* nocapture, i32* nocapture) local_unnamed_addr #0 {
  %5 = load i32, i32* %3, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8, i8* %2, i64 %6
  %8 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %9 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %8, i64 0, i32 12
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %1, 0
  %12 = getelementptr inbounds i8, i8* %7, i64 2
  %13 = add i32 %10, 15
  %14 = and i32 %13, 15
  %not. = xor i1 %11, true
  %.sink14 = zext i1 %not. to i64
  %.02.in = select i1 %11, i8* %7, i8* %12
  %.01 = select i1 %11, i32 %14, i32 %10
  %.02 = bitcast i8* %.02.in to i16*
  %15 = and i32 %.01, 1
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %4
  %18 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %8, i64 0, i32 11, i64 %.sink14, i64 0, i64 0
  %19 = add nsw i32 %.01, 1
  %20 = and i32 %19, 15
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %8, i64 0, i32 11, i64 %.sink14, i64 1, i64 %21
  %23 = sext i32 %.01 to i64
  %24 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %8, i64 0, i32 11, i64 %.sink14, i64 0, i64 %23
  tail call void @dct64(double* %22, double* %24, double* %0) #2
  br label %32

; <label>:25:                                     ; preds = %4
  %26 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %8, i64 0, i32 11, i64 %.sink14, i64 1, i64 0
  %27 = add nsw i32 %.01, 1
  %28 = sext i32 %.01 to i64
  %29 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %8, i64 0, i32 11, i64 %.sink14, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %8, i64 0, i32 11, i64 %.sink14, i64 1, i64 %28
  %31 = getelementptr inbounds double, double* %30, i64 1
  tail call void @dct64(double* %29, double* %31, double* %0) #2
  br label %32

; <label>:32:                                     ; preds = %25, %17
  %.011 = phi i32 [ %.01, %17 ], [ %27, %25 ]
  %.04 = phi double* [ %18, %17 ], [ %26, %25 ]
  %33 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %34 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %33, i64 0, i32 12
  store i32 %.01, i32* %34, align 8
  %35 = sext i32 %.011 to i64
  %36 = sub nsw i64 0, %35
  %37 = getelementptr inbounds double, double* getelementptr inbounds ([544 x double], [544 x double]* @decwin, i64 0, i64 16), i64 %36
  %38 = load double, double* %37, align 8
  %39 = load double, double* %.04, align 8
  %40 = fmul double %38, %39
  %41 = sub nsw i64 496, %35
  %scevgep32 = getelementptr double, double* %.04, i64 240
  %scevgep34 = getelementptr i8, i8* %.02.in, i64 64
  br label %42

; <label>:42:                                     ; preds = %32, %143
  %43 = phi double [ %40, %32 ], [ %151, %143 ]
  %.027 = phi double* [ %37, %32 ], [ %146, %143 ]
  %.1326 = phi i16* [ %.02, %32 ], [ %147, %143 ]
  %.1525 = phi double* [ %.04, %32 ], [ %145, %143 ]
  %.0824 = phi i32 [ 0, %32 ], [ %.210, %143 ]
  %.01223 = phi i32 [ 16, %32 ], [ %144, %143 ]
  %44 = getelementptr inbounds double, double* %.027, i64 1
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %.1525, i64 1
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  %50 = getelementptr inbounds double, double* %.027, i64 2
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds double, double* %.1525, i64 2
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %49, %54
  %56 = getelementptr inbounds double, double* %.027, i64 3
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %.1525, i64 3
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %55, %60
  %62 = getelementptr inbounds double, double* %.027, i64 4
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds double, double* %.1525, i64 4
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  %68 = getelementptr inbounds double, double* %.027, i64 5
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds double, double* %.1525, i64 5
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fsub double %67, %72
  %74 = getelementptr inbounds double, double* %.027, i64 6
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds double, double* %.1525, i64 6
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %73, %78
  %80 = getelementptr inbounds double, double* %.027, i64 7
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds double, double* %.1525, i64 7
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fsub double %79, %84
  %86 = getelementptr inbounds double, double* %.027, i64 8
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds double, double* %.1525, i64 8
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = fadd double %85, %90
  %92 = getelementptr inbounds double, double* %.027, i64 9
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds double, double* %.1525, i64 9
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = fsub double %91, %96
  %98 = getelementptr inbounds double, double* %.027, i64 10
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds double, double* %.1525, i64 10
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = fadd double %97, %102
  %104 = getelementptr inbounds double, double* %.027, i64 11
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds double, double* %.1525, i64 11
  %107 = load double, double* %106, align 8
  %108 = fmul double %105, %107
  %109 = fsub double %103, %108
  %110 = getelementptr inbounds double, double* %.027, i64 12
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds double, double* %.1525, i64 12
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = fadd double %109, %114
  %116 = getelementptr inbounds double, double* %.027, i64 13
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds double, double* %.1525, i64 13
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = fsub double %115, %120
  %122 = getelementptr inbounds double, double* %.027, i64 14
  %123 = load double, double* %122, align 8
  %124 = getelementptr inbounds double, double* %.1525, i64 14
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  %127 = fadd double %121, %126
  %128 = getelementptr inbounds double, double* %.027, i64 15
  %129 = load double, double* %128, align 8
  %130 = getelementptr inbounds double, double* %.1525, i64 15
  %131 = load double, double* %130, align 8
  %132 = fmul double %129, %131
  %133 = fsub double %127, %132
  %134 = fcmp ogt double %133, 3.276700e+04
  br i1 %134, label %135, label %137

; <label>:135:                                    ; preds = %42
  store i16 32767, i16* %.1326, align 2
  %136 = add nsw i32 %.0824, 1
  br label %143

; <label>:137:                                    ; preds = %42
  %138 = fcmp olt double %133, -3.276800e+04
  br i1 %138, label %139, label %141

; <label>:139:                                    ; preds = %137
  store i16 -32768, i16* %.1326, align 2
  %140 = add nsw i32 %.0824, 1
  br label %143

; <label>:141:                                    ; preds = %137
  %142 = fptosi double %133 to i16
  store i16 %142, i16* %.1326, align 2
  br label %143

; <label>:143:                                    ; preds = %135, %141, %139
  %.210 = phi i32 [ %136, %135 ], [ %140, %139 ], [ %.0824, %141 ]
  %144 = add nsw i32 %.01223, -1
  %145 = getelementptr inbounds double, double* %.1525, i64 16
  %146 = getelementptr inbounds double, double* %.027, i64 32
  %147 = getelementptr inbounds i16, i16* %.1326, i64 2
  %148 = icmp eq i32 %144, 0
  %149 = load double, double* %146, align 8
  %150 = load double, double* %145, align 8
  %151 = fmul double %149, %150
  br i1 %148, label %152, label %42

; <label>:152:                                    ; preds = %143
  %scevgep = getelementptr [544 x double], [544 x double]* @decwin, i64 0, i64 %41
  %scevgep33 = getelementptr double, double* %.04, i64 256
  %scevgep3435 = bitcast i8* %scevgep34 to i16*
  %153 = getelementptr inbounds double, double* %scevgep, i64 34
  %154 = load double, double* %153, align 8
  %155 = getelementptr inbounds double, double* %.04, i64 258
  %156 = load double, double* %155, align 8
  %157 = fmul double %154, %156
  %158 = fadd double %151, %157
  %159 = getelementptr inbounds double, double* %scevgep, i64 36
  %160 = load double, double* %159, align 8
  %161 = getelementptr inbounds double, double* %.04, i64 260
  %162 = load double, double* %161, align 8
  %163 = fmul double %160, %162
  %164 = fadd double %158, %163
  %165 = getelementptr inbounds double, double* %scevgep, i64 38
  %166 = load double, double* %165, align 8
  %167 = getelementptr inbounds double, double* %.04, i64 262
  %168 = load double, double* %167, align 8
  %169 = fmul double %166, %168
  %170 = fadd double %164, %169
  %171 = getelementptr inbounds double, double* %scevgep, i64 40
  %172 = load double, double* %171, align 8
  %173 = getelementptr inbounds double, double* %.04, i64 264
  %174 = load double, double* %173, align 8
  %175 = fmul double %172, %174
  %176 = fadd double %170, %175
  %177 = getelementptr inbounds double, double* %scevgep, i64 42
  %178 = load double, double* %177, align 8
  %179 = getelementptr inbounds double, double* %.04, i64 266
  %180 = load double, double* %179, align 8
  %181 = fmul double %178, %180
  %182 = fadd double %176, %181
  %183 = getelementptr inbounds double, double* %scevgep, i64 44
  %184 = load double, double* %183, align 8
  %185 = getelementptr inbounds double, double* %.04, i64 268
  %186 = load double, double* %185, align 8
  %187 = fmul double %184, %186
  %188 = fadd double %182, %187
  %189 = getelementptr inbounds double, double* %scevgep, i64 46
  %190 = load double, double* %189, align 8
  %191 = getelementptr inbounds double, double* %.04, i64 270
  %192 = load double, double* %191, align 8
  %193 = fmul double %190, %192
  %194 = fadd double %188, %193
  %195 = fcmp ogt double %194, 3.276700e+04
  br i1 %195, label %196, label %198

; <label>:196:                                    ; preds = %152
  store i16 32767, i16* %scevgep3435, align 2
  %197 = add nsw i32 %.210, 1
  br label %204

; <label>:198:                                    ; preds = %152
  %199 = fcmp olt double %194, -3.276800e+04
  br i1 %199, label %200, label %202

; <label>:200:                                    ; preds = %198
  store i16 -32768, i16* %scevgep3435, align 2
  %201 = add nsw i32 %.210, 1
  br label %204

; <label>:202:                                    ; preds = %198
  %203 = fptosi double %194 to i16
  store i16 %203, i16* %scevgep3435, align 2
  br label %204

; <label>:204:                                    ; preds = %200, %202, %196
  %.4 = phi i32 [ %197, %196 ], [ %201, %200 ], [ %.210, %202 ]
  %205 = shl i32 %.011, 1
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds double, double* %scevgep, i64 %206
  %.215 = getelementptr inbounds i8, i8* %.02.in, i64 68
  %208 = bitcast i8* %.215 to i16*
  br label %209

; <label>:209:                                    ; preds = %204, %313
  %.2622 = phi double* [ %scevgep32, %204 ], [ %.26, %313 ]
  %.221 = phi i16* [ %208, %204 ], [ %.2, %313 ]
  %.120 = phi double* [ %207, %204 ], [ %315, %313 ]
  %.15.pn19 = phi double* [ %scevgep33, %204 ], [ %.2622, %313 ]
  %.518 = phi i32 [ %.4, %204 ], [ %.7, %313 ]
  %.11317 = phi i32 [ 15, %204 ], [ %314, %313 ]
  %210 = getelementptr inbounds double, double* %.120, i64 -1
  %211 = load double, double* %210, align 8
  %212 = load double, double* %.2622, align 8
  %213 = fmul double %211, %212
  %214 = fsub double -0.000000e+00, %213
  %215 = getelementptr inbounds double, double* %.120, i64 -2
  %216 = load double, double* %215, align 8
  %217 = getelementptr inbounds double, double* %.15.pn19, i64 -15
  %218 = load double, double* %217, align 8
  %219 = fmul double %216, %218
  %220 = fsub double %214, %219
  %221 = getelementptr inbounds double, double* %.120, i64 -3
  %222 = load double, double* %221, align 8
  %223 = getelementptr inbounds double, double* %.15.pn19, i64 -14
  %224 = load double, double* %223, align 8
  %225 = fmul double %222, %224
  %226 = fsub double %220, %225
  %227 = getelementptr inbounds double, double* %.120, i64 -4
  %228 = load double, double* %227, align 8
  %229 = getelementptr inbounds double, double* %.15.pn19, i64 -13
  %230 = load double, double* %229, align 8
  %231 = fmul double %228, %230
  %232 = fsub double %226, %231
  %233 = getelementptr inbounds double, double* %.120, i64 -5
  %234 = load double, double* %233, align 8
  %235 = getelementptr inbounds double, double* %.15.pn19, i64 -12
  %236 = load double, double* %235, align 8
  %237 = fmul double %234, %236
  %238 = fsub double %232, %237
  %239 = getelementptr inbounds double, double* %.120, i64 -6
  %240 = load double, double* %239, align 8
  %241 = getelementptr inbounds double, double* %.15.pn19, i64 -11
  %242 = load double, double* %241, align 8
  %243 = fmul double %240, %242
  %244 = fsub double %238, %243
  %245 = getelementptr inbounds double, double* %.120, i64 -7
  %246 = load double, double* %245, align 8
  %247 = getelementptr inbounds double, double* %.15.pn19, i64 -10
  %248 = load double, double* %247, align 8
  %249 = fmul double %246, %248
  %250 = fsub double %244, %249
  %251 = getelementptr inbounds double, double* %.120, i64 -8
  %252 = load double, double* %251, align 8
  %253 = getelementptr inbounds double, double* %.15.pn19, i64 -9
  %254 = load double, double* %253, align 8
  %255 = fmul double %252, %254
  %256 = fsub double %250, %255
  %257 = getelementptr inbounds double, double* %.120, i64 -9
  %258 = load double, double* %257, align 8
  %259 = getelementptr inbounds double, double* %.15.pn19, i64 -8
  %260 = load double, double* %259, align 8
  %261 = fmul double %258, %260
  %262 = fsub double %256, %261
  %263 = getelementptr inbounds double, double* %.120, i64 -10
  %264 = load double, double* %263, align 8
  %265 = getelementptr inbounds double, double* %.15.pn19, i64 -7
  %266 = load double, double* %265, align 8
  %267 = fmul double %264, %266
  %268 = fsub double %262, %267
  %269 = getelementptr inbounds double, double* %.120, i64 -11
  %270 = load double, double* %269, align 8
  %271 = getelementptr inbounds double, double* %.15.pn19, i64 -6
  %272 = load double, double* %271, align 8
  %273 = fmul double %270, %272
  %274 = fsub double %268, %273
  %275 = getelementptr inbounds double, double* %.120, i64 -12
  %276 = load double, double* %275, align 8
  %277 = getelementptr inbounds double, double* %.15.pn19, i64 -5
  %278 = load double, double* %277, align 8
  %279 = fmul double %276, %278
  %280 = fsub double %274, %279
  %281 = getelementptr inbounds double, double* %.120, i64 -13
  %282 = load double, double* %281, align 8
  %283 = getelementptr inbounds double, double* %.15.pn19, i64 -4
  %284 = load double, double* %283, align 8
  %285 = fmul double %282, %284
  %286 = fsub double %280, %285
  %287 = getelementptr inbounds double, double* %.120, i64 -14
  %288 = load double, double* %287, align 8
  %289 = getelementptr inbounds double, double* %.15.pn19, i64 -3
  %290 = load double, double* %289, align 8
  %291 = fmul double %288, %290
  %292 = fsub double %286, %291
  %293 = getelementptr inbounds double, double* %.120, i64 -15
  %294 = load double, double* %293, align 8
  %295 = getelementptr inbounds double, double* %.15.pn19, i64 -2
  %296 = load double, double* %295, align 8
  %297 = fmul double %294, %296
  %298 = fsub double %292, %297
  %299 = load double, double* %.120, align 8
  %300 = getelementptr inbounds double, double* %.15.pn19, i64 -1
  %301 = load double, double* %300, align 8
  %302 = fmul double %299, %301
  %303 = fsub double %298, %302
  %304 = fcmp ogt double %303, 3.276700e+04
  br i1 %304, label %305, label %307

; <label>:305:                                    ; preds = %209
  store i16 32767, i16* %.221, align 2
  %306 = add nsw i32 %.518, 1
  br label %313

; <label>:307:                                    ; preds = %209
  %308 = fcmp olt double %303, -3.276800e+04
  br i1 %308, label %309, label %311

; <label>:309:                                    ; preds = %307
  store i16 -32768, i16* %.221, align 2
  %310 = add nsw i32 %.518, 1
  br label %313

; <label>:311:                                    ; preds = %307
  %312 = fptosi double %303 to i16
  store i16 %312, i16* %.221, align 2
  br label %313

; <label>:313:                                    ; preds = %305, %311, %309
  %.7 = phi i32 [ %306, %305 ], [ %310, %309 ], [ %.518, %311 ]
  %314 = add nsw i32 %.11317, -1
  %315 = getelementptr inbounds double, double* %.120, i64 -32
  %.2 = getelementptr inbounds i16, i16* %.221, i64 2
  %.26 = getelementptr inbounds double, double* %.2622, i64 -16
  %316 = icmp eq i32 %314, 0
  br i1 %316, label %317, label %209

; <label>:317:                                    ; preds = %313
  %318 = load i32, i32* %3, align 4
  %319 = add nsw i32 %318, 128
  store i32 %319, i32* %3, align 4
  ret i32 %.7
}

declare void @dct64(double*, double*, double*) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
