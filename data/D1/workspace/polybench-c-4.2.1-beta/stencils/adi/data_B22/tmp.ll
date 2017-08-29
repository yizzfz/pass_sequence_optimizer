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
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
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

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %2 = add i64 %indvars.iv5, 1000
  %3 = trunc i64 %2 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 %3, %4
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 %3, %8
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
.preheader7.lr.ph:
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge25, %.preheader7.lr.ph
  %storemerge26 = phi i32 [ 1, %.preheader7.lr.ph ], [ %150, %._crit_edge25 ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %.preheader7, %._crit_edge12.us
  %indvar = phi i64 [ 0, %.preheader7 ], [ %indvar.next, %._crit_edge12.us ]
  %indvars.iv30 = phi i64 [ 1, %.preheader7 ], [ %indvars.iv.next31, %._crit_edge12.us ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv30
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv30, -1
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %bound0 = icmp ult double* %scevgep, %scevgep51
  %bound1 = icmp ult double* %scevgep49, %scevgep47
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv.lver.orig
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next31
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %15
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
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv.lver.orig
  store double %36, double* %37, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %scevgep54 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep53, align 8
  %load_initial55 = load double, double* %scevgep54, align 8
  br label %._crit_edge

._crit_edge12.us:                                 ; preds = %.lr.ph11.us
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond33, label %._crit_edge45.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge45.lver.check.preheader:               ; preds = %._crit_edge12.us
  br label %._crit_edge45.lver.check

.lr.ph11.us:                                      ; preds = %.lr.ph11.us, %._crit_edge.us
  %indvars.iv28 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next29.1, %.lr.ph11.us ]
  %38 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %51, %.lr.ph11.us ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv28
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %38
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv28
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv30
  store double %44, double* %45, align 8
  %indvars.iv.next29 = add nsw i64 %indvars.iv28, -1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv.next29
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %44
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv.next29
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next29, i64 %indvars.iv30
  store double %51, double* %52, align 8
  %53 = icmp sgt i64 %indvars.iv.next29, 1
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, -2
  br i1 %53, label %.lr.ph11.us, label %._crit_edge12.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded56 = phi double [ %load_initial55, %._crit_edge.ph ], [ %70, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %58, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next31
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %57 = fadd double %.rhs, 0x40AF420000000001
  %58 = fdiv double 0x409F400000000001, %57
  store double %58, double* %54, align 8
  %59 = bitcast double* %55 to <2 x double>*
  %60 = load <2 x double>, <2 x double>* %59, align 8
  %61 = fmul <2 x double> %60, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fsub double %63, %62
  %65 = load double, double* %56, align 8
  %66 = fmul double %65, 0xC08F400000000001
  %67 = fsub double %64, %66
  %68 = fmul double %store_forwarded56, 0xC09F400000000001
  %69 = fsub double %67, %68
  %70 = fdiv double %69, %57
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv
  store double %70, double* %71, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.us.loopexit78, label %._crit_edge

._crit_edge.us.loopexit:                          ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit78:                        ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit78, %._crit_edge.us.loopexit
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv30
  store double 1.000000e+00, double* %72, align 8
  br label %.lr.ph11.us

._crit_edge45.lver.check:                         ; preds = %._crit_edge45.lver.check.preheader, %._crit_edge22.us
  %indvar57 = phi i64 [ %indvar.next58, %._crit_edge22.us ], [ 0, %._crit_edge45.lver.check.preheader ]
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge22.us ], [ 1, %._crit_edge45.lver.check.preheader ]
  %73 = add i64 %indvar57, 1
  %74 = add i64 %indvar57, 1
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %4, i64 %74, i64 0
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %4, i64 %74, i64 999
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %5, i64 %74, i64 0
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %5, i64 %74, i64 999
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv40, i64 0
  store double 1.000000e+00, double* %75, align 8
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv40, i64 0
  store double 0.000000e+00, double* %76, align 8
  %77 = bitcast double* %75 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40
  %80 = bitcast [1000 x double]* %79 to i64*
  store i64 %78, i64* %80, align 8
  %81 = add nsw i64 %indvars.iv40, -1
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %bound067 = icmp ult double* %scevgep59, %scevgep65
  %bound168 = icmp ult double* %scevgep63, %scevgep61
  %memcheck.conflict70 = and i1 %bound067, %bound168
  br i1 %memcheck.conflict70, label %._crit_edge45.lver.orig.preheader, label %._crit_edge45.ph

._crit_edge45.lver.orig.preheader:                ; preds = %._crit_edge45.lver.check
  br label %._crit_edge45.lver.orig

._crit_edge45.lver.orig:                          ; preds = %._crit_edge45.lver.orig.preheader, %._crit_edge45.lver.orig
  %indvars.iv34.lver.orig = phi i64 [ %indvars.iv.next35.lver.orig, %._crit_edge45.lver.orig ], [ 1, %._crit_edge45.lver.orig.preheader ]
  %82 = add nsw i64 %indvars.iv34.lver.orig, -1
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv40, i64 %82
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv34.lver.orig
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %81, i64 %indvars.iv34.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv34.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next41, i64 %indvars.iv34.lver.orig
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %82
  %90 = insertelement <2 x double> undef, double %84, i32 0
  %91 = shufflevector <2 x double> %90, <2 x double> undef, <2 x i32> zeroinitializer
  %92 = fmul <2 x double> %91, <double 0xC08F400000000001, double 0xC08F400000000001>
  %93 = fadd <2 x double> %92, <double 0x409F440000000001, double 0x409F440000000001>
  %94 = extractelement <2 x double> %93, i32 0
  %95 = extractelement <2 x double> %93, i32 1
  %96 = fdiv double 0x408F400000000001, %94
  store double %96, double* %85, align 8
  %97 = load double, double* %86, align 8
  %98 = fmul double %97, 0xC09F400000000001
  %99 = load double, double* %87, align 8
  %100 = fmul double %99, 0xC0AF3E0000000001
  %101 = fsub double %100, %98
  %102 = load double, double* %88, align 8
  %103 = fmul double %102, 0xC09F400000000001
  %104 = fsub double %101, %103
  %105 = load double, double* %89, align 8
  %106 = fmul double %105, 0xC08F400000000001
  %107 = fsub double %104, %106
  %108 = fdiv double %107, %95
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv34.lver.orig
  store double %108, double* %109, align 8
  %indvars.iv.next35.lver.orig = add nuw nsw i64 %indvars.iv34.lver.orig, 1
  %exitcond37.lver.orig = icmp eq i64 %indvars.iv.next35.lver.orig, 999
  br i1 %exitcond37.lver.orig, label %._crit_edge18.us.loopexit, label %._crit_edge45.lver.orig

._crit_edge45.ph:                                 ; preds = %._crit_edge45.lver.check
  %scevgep74 = getelementptr [1000 x double], [1000 x double]* %5, i64 %73, i64 0
  %scevgep71 = getelementptr [1000 x double], [1000 x double]* %4, i64 %73, i64 0
  %load_initial72 = load double, double* %scevgep71, align 8
  %load_initial75 = load double, double* %scevgep74, align 8
  br label %._crit_edge45

._crit_edge22.us:                                 ; preds = %.lr.ph21.us
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 999
  %indvar.next58 = add i64 %indvar57, 1
  br i1 %exitcond43, label %._crit_edge25, label %._crit_edge45.lver.check

.lr.ph21.us:                                      ; preds = %.lr.ph21.us, %._crit_edge18.us
  %indvars.iv38 = phi i64 [ 998, %._crit_edge18.us ], [ %indvars.iv.next39.1, %.lr.ph21.us ]
  %110 = phi double [ 1.000000e+00, %._crit_edge18.us ], [ %123, %.lr.ph21.us ]
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv38
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, %110
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv38
  %115 = load double, double* %114, align 8
  %116 = fadd double %113, %115
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv38
  store double %116, double* %117, align 8
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, -1
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next39
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, %116
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next39
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv.next39
  store double %123, double* %124, align 8
  %125 = icmp sgt i64 %indvars.iv.next39, 1
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, -2
  br i1 %125, label %.lr.ph21.us, label %._crit_edge22.us

._crit_edge45:                                    ; preds = %._crit_edge45, %._crit_edge45.ph
  %store_forwarded76 = phi double [ %load_initial75, %._crit_edge45.ph ], [ %147, %._crit_edge45 ]
  %store_forwarded73 = phi double [ %load_initial72, %._crit_edge45.ph ], [ %136, %._crit_edge45 ]
  %indvars.iv34 = phi i64 [ 1, %._crit_edge45.ph ], [ %indvars.iv.next35, %._crit_edge45 ]
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv34
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %81, i64 %indvars.iv34
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv34
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next41, i64 %indvars.iv34
  %130 = insertelement <2 x double> undef, double %store_forwarded73, i32 0
  %131 = shufflevector <2 x double> %130, <2 x double> undef, <2 x i32> zeroinitializer
  %132 = fmul <2 x double> %131, <double 0xC08F400000000001, double 0xC08F400000000001>
  %133 = fadd <2 x double> %132, <double 0x409F440000000001, double 0x409F440000000001>
  %134 = extractelement <2 x double> %133, i32 0
  %135 = extractelement <2 x double> %133, i32 1
  %136 = fdiv double 0x408F400000000001, %134
  store double %136, double* %126, align 8
  %137 = load double, double* %127, align 8
  %138 = fmul double %137, 0xC09F400000000001
  %139 = load double, double* %128, align 8
  %140 = fmul double %139, 0xC0AF3E0000000001
  %141 = fsub double %140, %138
  %142 = load double, double* %129, align 8
  %143 = fmul double %142, 0xC09F400000000001
  %144 = fsub double %141, %143
  %145 = fmul double %store_forwarded76, 0xC08F400000000001
  %146 = fsub double %144, %145
  %147 = fdiv double %146, %135
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv34
  store double %147, double* %148, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 999
  br i1 %exitcond37, label %._crit_edge18.us.loopexit77, label %._crit_edge45

._crit_edge18.us.loopexit:                        ; preds = %._crit_edge45.lver.orig
  br label %._crit_edge18.us

._crit_edge18.us.loopexit77:                      ; preds = %._crit_edge45
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %._crit_edge18.us.loopexit77, %._crit_edge18.us.loopexit
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv40, i64 999
  store double 1.000000e+00, double* %149, align 8
  br label %.lr.ph21.us

._crit_edge25:                                    ; preds = %._crit_edge22.us
  %exitcond44 = icmp eq i32 %storemerge26, 500
  %150 = add nuw nsw i32 %storemerge26, 1
  br i1 %exitcond44, label %._crit_edge27, label %.preheader7

._crit_edge27:                                    ; preds = %._crit_edge25
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv5, 1000
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

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
