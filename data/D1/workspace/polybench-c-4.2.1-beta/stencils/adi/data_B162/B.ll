; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @init_array([1000 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
.lr.ph11:
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph11, %.loopexit
  %indvars.iv48 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next5, %.loopexit ]
  %1 = add nuw nsw i64 %indvars.iv48, 1000
  br label %2

; <label>:2:                                      ; preds = %2, %.lr.ph
  %indvars.iv7 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %2 ]
  %3 = sub nuw nsw i64 %1, %indvars.iv7
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv7
  %indvars.iv.next = or i64 %indvars.iv7, 1
  %7 = sub nuw nsw i64 %1, %indvars.iv.next
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %5, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fdiv <2 x double> %11, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %.loopexit, label %2

.loopexit:                                        ; preds = %2
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp ne i64 %indvars.iv.next5, 1000
  br i1 %exitcond, label %.lr.ph, label %.loopexit13

.loopexit13:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.loopexit38, %._crit_edge.preheader.lr.ph
  %4 = phi i32 [ 1, %._crit_edge.preheader.lr.ph ], [ %145, %.loopexit38 ]
  br label %.lver.check

._crit_edge.loopexit:                             ; preds = %58
  %exitcond75 = icmp ne i64 %5, 998
  br i1 %exitcond75, label %.lver.check, label %.lr.ph35.preheader

.lr.ph35.preheader:                               ; preds = %._crit_edge.loopexit
  br label %.lr.ph35

.lver.check:                                      ; preds = %._crit_edge.preheader, %._crit_edge.loopexit
  %indvar = phi i64 [ 0, %._crit_edge.preheader ], [ %5, %._crit_edge.loopexit ]
  %indvars.iv724 = phi i64 [ 1, %._crit_edge.preheader ], [ %indvars.iv.next8, %._crit_edge.loopexit ]
  %5 = add nuw nsw i64 %indvar, 1
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv724
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv724, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv724
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv724, -1
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv724, 1
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %scevgep41 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %bound0 = icmp ult double* %scevgep47, %scevgep45
  %bound1 = icmp ult double* %scevgep48, %scevgep41
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv18.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv18.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv724, i64 %13
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, 0xC09F400000000001
  %17 = fadd double %16, 0x40AF420000000001
  %18 = fdiv double 0x409F400000000001, %17
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv724, i64 %indvars.iv18.lver.orig
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.lver.orig, i64 %12
  %21 = bitcast double* %20 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %23 = fmul <2 x double> %22, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %26 = fsub double %25, %24
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.lver.orig, i64 %indvars.iv.next8
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %26, %29
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv724, i64 %13
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = fsub double %30, %33
  %35 = fdiv double %34, %17
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv724, i64 %indvars.iv18.lver.orig
  store double %35, double* %36, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv18.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit37.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep47, align 8
  %load_initial49 = load double, double* %scevgep48, align 8
  br label %37

; <label>:37:                                     ; preds = %.ph, %37
  %store_forwarded50 = phi double [ %load_initial49, %.ph ], [ %55, %37 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %40, %37 ]
  %indvars.iv18 = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %37 ]
  %38 = fmul double %store_forwarded, 0xC09F400000000001
  %39 = fadd double %38, 0x40AF420000000001
  %40 = fdiv double 0x409F400000000001, %39
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv724, i64 %indvars.iv18
  store double %40, double* %41, align 8
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %12
  %43 = bitcast double* %42 to <2 x double>*
  %44 = load <2 x double>, <2 x double>* %43, align 8
  %45 = fmul <2 x double> %44, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %46 = extractelement <2 x double> %45, i32 0
  %47 = extractelement <2 x double> %45, i32 1
  %48 = fsub double %47, %46
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next8
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, 0xC08F400000000001
  %52 = fsub double %48, %51
  %53 = fmul double %store_forwarded50, 0xC09F400000000001
  %54 = fsub double %52, %53
  %55 = fdiv double %54, %39
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv724, i64 %indvars.iv18
  store double %55, double* %56, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.loopexit37.loopexit74, label %37

.loopexit37.loopexit:                             ; preds = %.ph.lver.orig
  br label %.loopexit37

.loopexit37.loopexit74:                           ; preds = %37
  br label %.loopexit37

.loopexit37:                                      ; preds = %.loopexit37.loopexit74, %.loopexit37.loopexit
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv724
  store double 1.000000e+00, double* %57, align 8
  br label %58

; <label>:58:                                     ; preds = %58, %.loopexit37
  %59 = phi double [ 1.000000e+00, %.loopexit37 ], [ %72, %58 ]
  %indvars.iv521 = phi i64 [ 998, %.loopexit37 ], [ %indvars.iv.next6.1, %58 ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv724, i64 %indvars.iv521
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %59
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv724, i64 %indvars.iv521
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv521, i64 %indvars.iv724
  store double %65, double* %66, align 8
  %indvars.iv.next6 = add nsw i64 %indvars.iv521, -1
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv724, i64 %indvars.iv.next6
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %65
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv724, i64 %indvars.iv.next6
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next6, i64 %indvars.iv724
  store double %72, double* %73, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv521, -2
  %74 = icmp sgt i64 %indvars.iv.next6, 1
  br i1 %74, label %58, label %._crit_edge.loopexit

._crit_edge2.loopexit:                            ; preds = %128
  %exitcond76 = icmp ne i64 %75, 998
  br i1 %exitcond76, label %.lr.ph35, label %.loopexit38

.lr.ph35:                                         ; preds = %.lr.ph35.preheader, %._crit_edge2.loopexit
  %indvar51 = phi i64 [ %75, %._crit_edge2.loopexit ], [ 0, %.lr.ph35.preheader ]
  %indvars.iv1533 = phi i64 [ %indvars.iv.next16, %._crit_edge2.loopexit ], [ 1, %.lr.ph35.preheader ]
  %75 = add nuw nsw i64 %indvar51, 1
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 0
  %scevgep70 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 0
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1533, i64 0
  store double 1.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1533, i64 0
  store double 0.000000e+00, double* %77, align 8
  %78 = bitcast double* %76 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1533
  %81 = bitcast [1000 x double]* %80 to i64*
  store i64 %79, i64* %81, align 8
  %82 = add nsw i64 %indvars.iv1533, -1
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1533, 1
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 999
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 999
  %bound061 = icmp ult double* %scevgep67, %scevgep59
  %bound162 = icmp ult double* %scevgep70, %scevgep55
  %memcheck.conflict64 = and i1 %bound061, %bound162
  br i1 %memcheck.conflict64, label %.ph66.lver.orig.preheader, label %.ph66

.ph66.lver.orig.preheader:                        ; preds = %.lr.ph35
  br label %.ph66.lver.orig

.ph66.lver.orig:                                  ; preds = %.ph66.lver.orig.preheader, %.ph66.lver.orig
  %indvars.iv928.lver.orig = phi i64 [ %indvars.iv.next10.lver.orig, %.ph66.lver.orig ], [ 1, %.ph66.lver.orig.preheader ]
  %83 = add nsw i64 %indvars.iv928.lver.orig, -1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1533, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, 0xC08F400000000001
  %87 = fadd double %86, 0x409F440000000001
  %88 = fdiv double 0x408F400000000001, %87
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1533, i64 %indvars.iv928.lver.orig
  store double %88, double* %89, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv928.lver.orig
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, 0xC09F400000000001
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1533, i64 %indvars.iv928.lver.orig
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, 0xC0AF3E0000000001
  %96 = fsub double %95, %92
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next16, i64 %indvars.iv928.lver.orig
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, 0xC09F400000000001
  %100 = fsub double %96, %99
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1533, i64 %83
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, 0xC08F400000000001
  %104 = fsub double %100, %103
  %105 = fdiv double %104, %87
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1533, i64 %indvars.iv928.lver.orig
  store double %105, double* %106, align 8
  %indvars.iv.next10.lver.orig = add nuw nsw i64 %indvars.iv928.lver.orig, 1
  %exitcond12.lver.orig = icmp eq i64 %indvars.iv.next10.lver.orig, 999
  br i1 %exitcond12.lver.orig, label %.loopexit.loopexit, label %.ph66.lver.orig

.ph66:                                            ; preds = %.lr.ph35
  %load_initial68 = load double, double* %scevgep67, align 8
  %load_initial71 = load double, double* %scevgep70, align 8
  br label %107

; <label>:107:                                    ; preds = %.ph66, %107
  %store_forwarded72 = phi double [ %load_initial71, %.ph66 ], [ %125, %107 ]
  %store_forwarded69 = phi double [ %load_initial68, %.ph66 ], [ %110, %107 ]
  %indvars.iv928 = phi i64 [ 1, %.ph66 ], [ %indvars.iv.next10, %107 ]
  %108 = fmul double %store_forwarded69, 0xC08F400000000001
  %109 = fadd double %108, 0x409F440000000001
  %110 = fdiv double 0x408F400000000001, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1533, i64 %indvars.iv928
  store double %110, double* %111, align 8
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv928
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, 0xC09F400000000001
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1533, i64 %indvars.iv928
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, 0xC0AF3E0000000001
  %118 = fsub double %117, %114
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next16, i64 %indvars.iv928
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, 0xC09F400000000001
  %122 = fsub double %118, %121
  %123 = fmul double %store_forwarded72, 0xC08F400000000001
  %124 = fsub double %122, %123
  %125 = fdiv double %124, %109
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1533, i64 %indvars.iv928
  store double %125, double* %126, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv928, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 999
  br i1 %exitcond12, label %.loopexit.loopexit73, label %107

.loopexit.loopexit:                               ; preds = %.ph66.lver.orig
  br label %.loopexit

.loopexit.loopexit73:                             ; preds = %107
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit73, %.loopexit.loopexit
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1533, i64 999
  store double 1.000000e+00, double* %127, align 8
  br label %128

; <label>:128:                                    ; preds = %128, %.loopexit
  %129 = phi double [ 1.000000e+00, %.loopexit ], [ %142, %128 ]
  %indvars.iv1330 = phi i64 [ 998, %.loopexit ], [ %indvars.iv.next14.1, %128 ]
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1533, i64 %indvars.iv1330
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, %129
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1533, i64 %indvars.iv1330
  %134 = load double, double* %133, align 8
  %135 = fadd double %132, %134
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1533, i64 %indvars.iv1330
  store double %135, double* %136, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv1330, -1
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1533, i64 %indvars.iv.next14
  %138 = load double, double* %137, align 8
  %139 = fmul double %138, %135
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1533, i64 %indvars.iv.next14
  %141 = load double, double* %140, align 8
  %142 = fadd double %139, %141
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1533, i64 %indvars.iv.next14
  store double %142, double* %143, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1330, -2
  %144 = icmp sgt i64 %indvars.iv.next14, 1
  br i1 %144, label %128, label %._crit_edge2.loopexit

.loopexit38:                                      ; preds = %._crit_edge2.loopexit
  %145 = add nuw nsw i32 %4, 1
  %exitcond77 = icmp ne i32 %145, 501
  br i1 %exitcond77, label %._crit_edge.preheader, label %.loopexit39

.loopexit39:                                      ; preds = %.loopexit38
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph13:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph13, %.loopexit
  %indvars.iv410 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next5, %.loopexit ]
  %5 = mul nuw nsw i64 %indvars.iv410, 1000
  br label %6

; <label>:6:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv7 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %5, %indvars.iv7
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv410, i64 %indvars.iv7
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.loopexit, label %6

.loopexit:                                        ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  %exitcond16 = icmp ne i64 %indvars.iv.next5, 1000
  br i1 %exitcond16, label %.lr.ph, label %.loopexit15

.loopexit15:                                      ; preds = %.loopexit
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
