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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #0 {
  br label %.preheader

.preheader:                                       ; preds = %15, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %15 ]
  %2 = add nuw nsw i64 %indvars.iv4, 1000
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %3 ]
  %4 = sub nuw nsw i64 %2, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %2, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %15, label %3

; <label>:15:                                     ; preds = %3
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %16, label %.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader4

.preheader4:                                      ; preds = %155, %4
  %.038 = phi i32 [ 1, %4 ], [ %157, %155 ]
  br label %.lver.check

.lver.check:                                      ; preds = %74, %.preheader4
  %indvar = phi i64 [ %5, %74 ], [ 0, %.preheader4 ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %74 ], [ 1, %.preheader4 ]
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep28 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep30 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep32 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv16
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv16, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv16
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv16, -1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %bound0 = icmp ult double* %scevgep, %scevgep32
  %bound1 = icmp ult double* %scevgep30, %scevgep28
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv16, i64 %13
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.lver.orig
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next17
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv16, i64 %13
  %.lhs.lver.orig = fmul double %15, 0xC09F400000000001
  %20 = fadd double %.lhs.lver.orig, 0x40AF420000000001
  %21 = fdiv double 0x409F400000000001, %20
  store double %21, double* %16, align 8
  %22 = bitcast double* %17 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fsub double %26, %25
  %28 = load double, double* %18, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %27, %29
  %31 = load double, double* %19, align 8
  %32 = fmul double %31, 0xC09F400000000001
  %33 = fsub double %30, %32
  %34 = fdiv double %33, %20
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv.lver.orig
  store double %34, double* %35, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %.loopexit61, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial36 = load double, double* %scevgep30, align 8
  br label %36

; <label>:36:                                     ; preds = %36, %.ph
  %store_forwarded37 = phi double [ %load_initial36, %.ph ], [ %53, %36 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %41, %36 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %36 ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next17
  %.lhs = fmul double %store_forwarded, 0xC09F400000000001
  %40 = fadd double %.lhs, 0x40AF420000000001
  %41 = fdiv double 0x409F400000000001, %40
  store double %41, double* %37, align 8
  %42 = bitcast double* %38 to <2 x double>*
  %43 = load <2 x double>, <2 x double>* %42, align 8
  %44 = fmul <2 x double> %43, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  %47 = fsub double %46, %45
  %48 = load double, double* %39, align 8
  %49 = fmul double %48, 0xC08F400000000001
  %50 = fsub double %47, %49
  %51 = fmul double %store_forwarded37, 0xC09F400000000001
  %52 = fsub double %50, %51
  %53 = fdiv double %52, %40
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv
  store double %53, double* %54, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit62, label %36

.loopexit61:                                      ; preds = %.ph.lver.orig
  br label %55

.loopexit62:                                      ; preds = %36
  br label %55

; <label>:55:                                     ; preds = %.loopexit62, %.loopexit61
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv16
  store double 1.000000e+00, double* %56, align 8
  br label %57

; <label>:57:                                     ; preds = %57, %55
  %indvars.iv14 = phi i64 [ 998, %55 ], [ %indvars.iv.next15.1, %57 ]
  %58 = phi double [ 1.000000e+00, %55 ], [ %71, %57 ]
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv14
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %58
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv14
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv16
  store double %64, double* %65, align 8
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, -1
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next15
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %64
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv.next15
  %70 = load double, double* %69, align 8
  %71 = fadd double %68, %70
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next15, i64 %indvars.iv16
  store double %71, double* %72, align 8
  %73 = icmp sgt i64 %indvars.iv.next15, 1
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, -2
  br i1 %73, label %57, label %74

; <label>:74:                                     ; preds = %57
  %exitcond25 = icmp eq i64 %indvars.iv.next17, 999
  br i1 %exitcond25, label %.lver.check52.preheader, label %.lver.check

.lver.check52.preheader:                          ; preds = %74
  br label %.lver.check52

.lver.check52:                                    ; preds = %.lver.check52.preheader, %154
  %indvar38 = phi i64 [ %75, %154 ], [ 0, %.lver.check52.preheader ]
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %154 ], [ 1, %.lver.check52.preheader ]
  %75 = add i64 %indvar38, 1
  %scevgep40 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 0
  %scevgep42 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 999
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 0
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 999
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv23, i64 0
  store double 1.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv23, i64 0
  store double 0.000000e+00, double* %77, align 8
  %78 = bitcast double* %76 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23
  %81 = bitcast [1000 x double]* %80 to i64*
  store i64 %79, i64* %81, align 8
  %82 = add nsw i64 %indvars.iv23, -1
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %bound048 = icmp ult double* %scevgep40, %scevgep46
  %bound149 = icmp ult double* %scevgep44, %scevgep42
  %memcheck.conflict51 = and i1 %bound048, %bound149
  br i1 %memcheck.conflict51, label %.ph53.lver.orig.preheader, label %.ph53

.ph53.lver.orig.preheader:                        ; preds = %.lver.check52
  br label %.ph53.lver.orig

.ph53.lver.orig:                                  ; preds = %.ph53.lver.orig.preheader, %.ph53.lver.orig
  %indvars.iv18.lver.orig = phi i64 [ %indvars.iv.next19.lver.orig, %.ph53.lver.orig ], [ 1, %.ph53.lver.orig.preheader ]
  %83 = add nsw i64 %indvars.iv18.lver.orig, -1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv23, i64 %83
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv18.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv18.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv18.lver.orig
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next24, i64 %indvars.iv18.lver.orig
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %83
  %91 = insertelement <2 x double> undef, double %85, i32 0
  %92 = shufflevector <2 x double> %91, <2 x double> undef, <2 x i32> zeroinitializer
  %93 = fmul <2 x double> %92, <double 0xC08F400000000001, double 0xC08F400000000001>
  %94 = fadd <2 x double> %93, <double 0x409F440000000001, double 0x409F440000000001>
  %95 = extractelement <2 x double> %94, i32 0
  %96 = extractelement <2 x double> %94, i32 1
  %97 = fdiv double 0x408F400000000001, %95
  store double %97, double* %86, align 8
  %98 = load double, double* %87, align 8
  %99 = fmul double %98, 0xC09F400000000001
  %100 = load double, double* %88, align 8
  %101 = fmul double %100, 0xC0AF3E0000000001
  %102 = fsub double %101, %99
  %103 = load double, double* %89, align 8
  %104 = fmul double %103, 0xC09F400000000001
  %105 = fsub double %102, %104
  %106 = load double, double* %90, align 8
  %107 = fmul double %106, 0xC08F400000000001
  %108 = fsub double %105, %107
  %109 = fdiv double %108, %96
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv18.lver.orig
  store double %109, double* %110, align 8
  %exitcond20.lver.orig = icmp eq i64 %indvars.iv18.lver.orig, 998
  %indvars.iv.next19.lver.orig = add nuw nsw i64 %indvars.iv18.lver.orig, 1
  br i1 %exitcond20.lver.orig, label %.loopexit, label %.ph53.lver.orig

.ph53:                                            ; preds = %.lver.check52
  %load_initial55 = load double, double* %scevgep40, align 8
  %load_initial58 = load double, double* %scevgep44, align 8
  br label %111

; <label>:111:                                    ; preds = %111, %.ph53
  %store_forwarded59 = phi double [ %load_initial58, %.ph53 ], [ %133, %111 ]
  %store_forwarded56 = phi double [ %load_initial55, %.ph53 ], [ %122, %111 ]
  %indvars.iv18 = phi i64 [ 1, %.ph53 ], [ %indvars.iv.next19, %111 ]
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv18
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv18
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv18
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next24, i64 %indvars.iv18
  %116 = insertelement <2 x double> undef, double %store_forwarded56, i32 0
  %117 = shufflevector <2 x double> %116, <2 x double> undef, <2 x i32> zeroinitializer
  %118 = fmul <2 x double> %117, <double 0xC08F400000000001, double 0xC08F400000000001>
  %119 = fadd <2 x double> %118, <double 0x409F440000000001, double 0x409F440000000001>
  %120 = extractelement <2 x double> %119, i32 0
  %121 = extractelement <2 x double> %119, i32 1
  %122 = fdiv double 0x408F400000000001, %120
  store double %122, double* %112, align 8
  %123 = load double, double* %113, align 8
  %124 = fmul double %123, 0xC09F400000000001
  %125 = load double, double* %114, align 8
  %126 = fmul double %125, 0xC0AF3E0000000001
  %127 = fsub double %126, %124
  %128 = load double, double* %115, align 8
  %129 = fmul double %128, 0xC09F400000000001
  %130 = fsub double %127, %129
  %131 = fmul double %store_forwarded59, 0xC08F400000000001
  %132 = fsub double %130, %131
  %133 = fdiv double %132, %121
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv18
  store double %133, double* %134, align 8
  %exitcond20 = icmp eq i64 %indvars.iv18, 998
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  br i1 %exitcond20, label %.loopexit60, label %111

.loopexit:                                        ; preds = %.ph53.lver.orig
  br label %135

.loopexit60:                                      ; preds = %111
  br label %135

; <label>:135:                                    ; preds = %.loopexit60, %.loopexit
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv23, i64 999
  store double 1.000000e+00, double* %136, align 8
  br label %137

; <label>:137:                                    ; preds = %137, %135
  %indvars.iv21 = phi i64 [ 998, %135 ], [ %indvars.iv.next22.1, %137 ]
  %138 = phi double [ 1.000000e+00, %135 ], [ %151, %137 ]
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv21
  %140 = load double, double* %139, align 8
  %141 = fmul double %140, %138
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv21
  %143 = load double, double* %142, align 8
  %144 = fadd double %141, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv21
  store double %144, double* %145, align 8
  %indvars.iv.next22 = add nsw i64 %indvars.iv21, -1
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv.next22
  %147 = load double, double* %146, align 8
  %148 = fmul double %147, %144
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv.next22
  %150 = load double, double* %149, align 8
  %151 = fadd double %148, %150
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv.next22
  store double %151, double* %152, align 8
  %153 = icmp sgt i64 %indvars.iv.next22, 1
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, -2
  br i1 %153, label %137, label %154

; <label>:154:                                    ; preds = %137
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 999
  br i1 %exitcond26, label %155, label %.lver.check52

; <label>:155:                                    ; preds = %154
  %156 = icmp sgt i32 %.038, 499
  %157 = add nuw nsw i32 %.038, 1
  br i1 %156, label %158, label %.preheader4

; <label>:158:                                    ; preds = %155
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv5 = phi i64 [ 0, %1 ], [ %indvars.iv.next6, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
