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
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge10

.._crit_edge_crit_edge10:                         ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge10, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us..preheader.us_crit_edge ]
  %2 = add nuw nsw i64 %indvars.iv5, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader.us ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %8, double* %9, align 8
  %exitcond = icmp eq i64 %indvars.iv, 999
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %._crit_edge4, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader7.lr.ph:
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge25..preheader7_crit_edge, %.preheader7.lr.ph
  %storemerge26 = phi i32 [ 1, %.preheader7.lr.ph ], [ %139, %._crit_edge25..preheader7_crit_edge ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge12.us..lver.check_crit_edge, %.preheader7
  %indvar = phi i64 [ 0, %.preheader7 ], [ %indvar.next, %._crit_edge12.us..lver.check_crit_edge ]
  %indvars.iv31 = phi i64 [ 1, %.preheader7 ], [ %indvars.iv.next32, %._crit_edge12.us..lver.check_crit_edge ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv31
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv31, -1
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %bound0 = icmp ult double* %scevgep, %scevgep48
  %bound1 = icmp ult double* %scevgep46, %scevgep44
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lver.check..ph.lver.orig_crit_edge, label %.ph

.lver.check..ph.lver.orig_crit_edge:              ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig..ph.lver.orig_crit_edge, %.lver.check..ph.lver.orig_crit_edge
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig..ph.lver.orig_crit_edge ], [ 1, %.lver.check..ph.lver.orig_crit_edge ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.lver.orig
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next32
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31, i64 %15
  %.rhs.lver.orig = fmul double %17, 0xC09F400000000001
  %22 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %23 = fdiv double 0x409F400000000001, %22
  store double %23, double* %18, align 8
  %24 = bitcast double* %19 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %28, %27
  %30 = load double, double* %20, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %29, %31
  %33 = load double, double* %21, align 8
  %34 = fmul double %33, 0xC09F400000000001
  %35 = fsub double %32, %34
  %36 = fdiv double %35, %22
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv.lver.orig
  store double %36, double* %37, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  br i1 %exitcond.lver.orig, label %.ph.lver.orig.._crit_edge.us_crit_edge, label %.ph.lver.orig..ph.lver.orig_crit_edge

.ph.lver.orig..ph.lver.orig_crit_edge:            ; preds = %.ph.lver.orig
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br label %.ph.lver.orig

.ph.lver.orig.._crit_edge.us_crit_edge:           ; preds = %.ph.lver.orig
  br label %._crit_edge.us

.ph:                                              ; preds = %.lver.check
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep50 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep50, align 8
  %load_initial52 = load double, double* %scevgep51, align 8
  br label %47

._crit_edge12.us:                                 ; preds = %.lr.ph11.us
  %exitcond41 = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond41, label %._crit_edge12.us..lver.check68_crit_edge, label %._crit_edge12.us..lver.check_crit_edge

._crit_edge12.us..lver.check_crit_edge:           ; preds = %._crit_edge12.us
  %indvar.next = add i64 %indvar, 1
  br label %.lver.check

._crit_edge12.us..lver.check68_crit_edge:         ; preds = %._crit_edge12.us
  br label %.lver.check68

.lr.ph11.us:                                      ; preds = %.lr.ph11.us..lr.ph11.us_crit_edge, %._crit_edge.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %.lr.ph11.us..lr.ph11.us_crit_edge ], [ 998, %._crit_edge.us ]
  %38 = phi double [ %44, %.lr.ph11.us..lr.ph11.us_crit_edge ], [ 1.000000e+00, %._crit_edge.us ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv29
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %38
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv29
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv31
  store double %44, double* %45, align 8
  %46 = icmp sgt i64 %indvars.iv29, 1
  br i1 %46, label %.lr.ph11.us..lr.ph11.us_crit_edge, label %._crit_edge12.us

.lr.ph11.us..lr.ph11.us_crit_edge:                ; preds = %.lr.ph11.us
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, -1
  br label %.lr.ph11.us

; <label>:47:                                     ; preds = %._crit_edge, %.ph
  %store_forwarded53 = phi double [ %load_initial52, %.ph ], [ %64, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %52, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %._crit_edge ]
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next32
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %51 = fadd double %.rhs, 0x40AF420000000001
  %52 = fdiv double 0x409F400000000001, %51
  store double %52, double* %48, align 8
  %53 = bitcast double* %49 to <2 x double>*
  %54 = load <2 x double>, <2 x double>* %53, align 8
  %55 = fmul <2 x double> %54, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %58 = fsub double %57, %56
  %59 = load double, double* %50, align 8
  %60 = fmul double %59, 0xC08F400000000001
  %61 = fsub double %58, %60
  %62 = fmul double %store_forwarded53, 0xC09F400000000001
  %63 = fsub double %61, %62
  %64 = fdiv double %63, %51
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv
  store double %64, double* %65, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  br i1 %exitcond, label %.._crit_edge.us_crit_edge, label %._crit_edge

._crit_edge:                                      ; preds = %47
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %47

.._crit_edge.us_crit_edge:                        ; preds = %47
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %.ph.lver.orig.._crit_edge.us_crit_edge
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv31
  store double 1.000000e+00, double* %66, align 8
  br label %.lr.ph11.us

.lver.check68:                                    ; preds = %._crit_edge22.us..lver.check68_crit_edge, %._crit_edge12.us..lver.check68_crit_edge
  %indvar54 = phi i64 [ %indvar.next55, %._crit_edge22.us..lver.check68_crit_edge ], [ 0, %._crit_edge12.us..lver.check68_crit_edge ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge22.us..lver.check68_crit_edge ], [ 1, %._crit_edge12.us..lver.check68_crit_edge ]
  %67 = add i64 %indvar54, 1
  %68 = add i64 %indvar54, 1
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %4, i64 %68, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %4, i64 %68, i64 999
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %5, i64 %68, i64 0
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %5, i64 %68, i64 999
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 0
  store double 1.000000e+00, double* %69, align 8
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %70, align 8
  %71 = bitcast double* %69 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39
  %74 = bitcast [1000 x double]* %73 to i64*
  store i64 %72, i64* %74, align 8
  %75 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound064 = icmp ult double* %scevgep56, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep58
  %memcheck.conflict67 = and i1 %bound064, %bound165
  br i1 %memcheck.conflict67, label %.lver.check68..ph69.lver.orig_crit_edge, label %.ph69

.lver.check68..ph69.lver.orig_crit_edge:          ; preds = %.lver.check68
  br label %.ph69.lver.orig

.ph69.lver.orig:                                  ; preds = %.ph69.lver.orig..ph69.lver.orig_crit_edge, %.lver.check68..ph69.lver.orig_crit_edge
  %indvars.iv33.lver.orig = phi i64 [ %indvars.iv.next34.lver.orig, %.ph69.lver.orig..ph69.lver.orig_crit_edge ], [ 1, %.lver.check68..ph69.lver.orig_crit_edge ]
  %76 = add nsw i64 %indvars.iv33.lver.orig, -1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %76
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %75, i64 %indvars.iv33.lver.orig
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv33.lver.orig
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %76
  %84 = insertelement <2 x double> undef, double %78, i32 0
  %85 = shufflevector <2 x double> %84, <2 x double> undef, <2 x i32> zeroinitializer
  %86 = fmul <2 x double> %85, <double 0xC08F400000000001, double 0xC08F400000000001>
  %87 = fadd <2 x double> %86, <double 0x409F440000000001, double 0x409F440000000001>
  %88 = extractelement <2 x double> %87, i32 0
  %89 = extractelement <2 x double> %87, i32 1
  %90 = fdiv double 0x408F400000000001, %88
  store double %90, double* %79, align 8
  %91 = load double, double* %80, align 8
  %92 = fmul double %91, 0xC09F400000000001
  %93 = load double, double* %81, align 8
  %94 = fmul double %93, 0xC0AF3E0000000001
  %95 = fsub double %94, %92
  %96 = load double, double* %82, align 8
  %97 = fmul double %96, 0xC09F400000000001
  %98 = fsub double %95, %97
  %99 = load double, double* %83, align 8
  %100 = fmul double %99, 0xC08F400000000001
  %101 = fsub double %98, %100
  %102 = fdiv double %101, %89
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  store double %102, double* %103, align 8
  %exitcond36.lver.orig = icmp eq i64 %indvars.iv33.lver.orig, 998
  br i1 %exitcond36.lver.orig, label %.ph69.lver.orig.._crit_edge18.us_crit_edge, label %.ph69.lver.orig..ph69.lver.orig_crit_edge

.ph69.lver.orig..ph69.lver.orig_crit_edge:        ; preds = %.ph69.lver.orig
  %indvars.iv.next34.lver.orig = add nuw nsw i64 %indvars.iv33.lver.orig, 1
  br label %.ph69.lver.orig

.ph69.lver.orig.._crit_edge18.us_crit_edge:       ; preds = %.ph69.lver.orig
  br label %._crit_edge18.us

.ph69:                                            ; preds = %.lver.check68
  %scevgep73 = getelementptr [1000 x double], [1000 x double]* %5, i64 %67, i64 0
  %scevgep70 = getelementptr [1000 x double], [1000 x double]* %4, i64 %67, i64 0
  %load_initial71 = load double, double* %scevgep70, align 8
  %load_initial74 = load double, double* %scevgep73, align 8
  br label %113

._crit_edge22.us:                                 ; preds = %.lr.ph21.us
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 999
  br i1 %exitcond42, label %._crit_edge25, label %._crit_edge22.us..lver.check68_crit_edge

._crit_edge22.us..lver.check68_crit_edge:         ; preds = %._crit_edge22.us
  %indvar.next55 = add i64 %indvar54, 1
  br label %.lver.check68

.lr.ph21.us:                                      ; preds = %.lr.ph21.us..lr.ph21.us_crit_edge, %._crit_edge18.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %.lr.ph21.us..lr.ph21.us_crit_edge ], [ 998, %._crit_edge18.us ]
  %104 = phi double [ %110, %.lr.ph21.us..lr.ph21.us_crit_edge ], [ 1.000000e+00, %._crit_edge18.us ]
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv37
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, %104
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv37
  %109 = load double, double* %108, align 8
  %110 = fadd double %107, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv37
  store double %110, double* %111, align 8
  %112 = icmp sgt i64 %indvars.iv37, 1
  br i1 %112, label %.lr.ph21.us..lr.ph21.us_crit_edge, label %._crit_edge22.us

.lr.ph21.us..lr.ph21.us_crit_edge:                ; preds = %.lr.ph21.us
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, -1
  br label %.lr.ph21.us

; <label>:113:                                    ; preds = %._crit_edge76, %.ph69
  %store_forwarded75 = phi double [ %load_initial74, %.ph69 ], [ %135, %._crit_edge76 ]
  %store_forwarded72 = phi double [ %load_initial71, %.ph69 ], [ %124, %._crit_edge76 ]
  %indvars.iv33 = phi i64 [ 1, %.ph69 ], [ %indvars.iv.next34, %._crit_edge76 ]
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv33
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %75, i64 %indvars.iv33
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv33
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv33
  %118 = insertelement <2 x double> undef, double %store_forwarded72, i32 0
  %119 = shufflevector <2 x double> %118, <2 x double> undef, <2 x i32> zeroinitializer
  %120 = fmul <2 x double> %119, <double 0xC08F400000000001, double 0xC08F400000000001>
  %121 = fadd <2 x double> %120, <double 0x409F440000000001, double 0x409F440000000001>
  %122 = extractelement <2 x double> %121, i32 0
  %123 = extractelement <2 x double> %121, i32 1
  %124 = fdiv double 0x408F400000000001, %122
  store double %124, double* %114, align 8
  %125 = load double, double* %115, align 8
  %126 = fmul double %125, 0xC09F400000000001
  %127 = load double, double* %116, align 8
  %128 = fmul double %127, 0xC0AF3E0000000001
  %129 = fsub double %128, %126
  %130 = load double, double* %117, align 8
  %131 = fmul double %130, 0xC09F400000000001
  %132 = fsub double %129, %131
  %133 = fmul double %store_forwarded75, 0xC08F400000000001
  %134 = fsub double %132, %133
  %135 = fdiv double %134, %123
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv33
  store double %135, double* %136, align 8
  %exitcond36 = icmp eq i64 %indvars.iv33, 998
  br i1 %exitcond36, label %.._crit_edge18.us_crit_edge, label %._crit_edge76

._crit_edge76:                                    ; preds = %113
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  br label %113

.._crit_edge18.us_crit_edge:                      ; preds = %113
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %.._crit_edge18.us_crit_edge, %.ph69.lver.orig.._crit_edge18.us_crit_edge
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 999
  store double 1.000000e+00, double* %137, align 8
  br label %.lr.ph21.us

._crit_edge25:                                    ; preds = %._crit_edge22.us
  %138 = icmp slt i32 %storemerge26, 500
  br i1 %138, label %._crit_edge25..preheader7_crit_edge, label %._crit_edge27

._crit_edge25..preheader7_crit_edge:              ; preds = %._crit_edge25
  %139 = add nuw nsw i32 %storemerge26, 1
  br label %.preheader7

._crit_edge27:                                    ; preds = %._crit_edge25
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us..preheader.us_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv6, 1000
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge.._crit_edge5_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge5_crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge5.._crit_edge_crit_edge

._crit_edge5.._crit_edge_crit_edge:               ; preds = %._crit_edge5
  br label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5.._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge5_crit_edge

._crit_edge.._crit_edge5_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge5

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %._crit_edge4, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
