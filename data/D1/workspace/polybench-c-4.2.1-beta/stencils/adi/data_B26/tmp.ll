; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array([1000 x double]* %7)
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
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %1 = add nuw i64 %indvars.iv5, 1000
  %2 = trunc i64 %1 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = sub nuw nsw i32 %2, %3
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %8 = sub nuw nsw i32 %2, %7
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %5, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fdiv <2 x double> %11, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
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
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %142, %._crit_edge22 ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %.preheader4, %._crit_edge9.us
  %indvar = phi i64 [ 0, %.preheader4 ], [ %indvar.next, %._crit_edge9.us ]
  %indvars.iv27 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next28, %._crit_edge9.us ]
  %4 = add i64 %indvar, 1
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep49
  %bound1 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %13
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, 0xC09F400000000001
  %17 = fadd double %16, 0x40AF420000000001
  %18 = fdiv double 0x409F400000000001, %17
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %21 = bitcast double* %20 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %23 = fmul <2 x double> %22, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %26 = fsub double %25, %24
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %26, %29
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %13
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = fsub double %30, %33
  %35 = fdiv double %34, %17
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %35, double* %36, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %scevgep52 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %load_initial = load double, double* %scevgep51, align 8
  %load_initial53 = load double, double* %scevgep52, align 8
  br label %._crit_edge

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond30, label %._crit_edge42.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge42.lver.check.preheader:               ; preds = %._crit_edge9.us
  br label %._crit_edge42.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %._crit_edge.us
  %indvars.iv25 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next26.1, %.lr.ph8.us ]
  %37 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %50, %.lr.ph8.us ]
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv25
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %37
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv25
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv27
  store double %43, double* %44, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv.next26
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %43
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv.next26
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %50, double* %51, align 8
  %52 = icmp sgt i64 %indvars.iv.next26, 1
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  br i1 %52, label %.lr.ph8.us, label %._crit_edge9.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded54 = phi double [ %load_initial53, %._crit_edge.ph ], [ %70, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %55, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %53 = fmul double %store_forwarded, 0xC09F400000000001
  %54 = fadd double %53, 0x40AF420000000001
  %55 = fdiv double 0x409F400000000001, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv
  store double %55, double* %56, align 8
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %58 = bitcast double* %57 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 8
  %60 = fmul <2 x double> %59, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fsub double %62, %61
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next28
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, 0xC08F400000000001
  %67 = fsub double %63, %66
  %68 = fmul double %store_forwarded54, 0xC09F400000000001
  %69 = fsub double %67, %68
  %70 = fdiv double %69, %54
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv
  store double %70, double* %71, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.us.loopexit76, label %._crit_edge

._crit_edge.us.loopexit:                          ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit76:                        ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit76, %._crit_edge.us.loopexit
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv27
  store double 1.000000e+00, double* %72, align 8
  br label %.lr.ph8.us

._crit_edge42.lver.check:                         ; preds = %._crit_edge42.lver.check.preheader, %._crit_edge19.us
  %indvar55 = phi i64 [ %indvar.next56, %._crit_edge19.us ], [ 0, %._crit_edge42.lver.check.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 1, %._crit_edge42.lver.check.preheader ]
  %73 = add i64 %indvar55, 1
  %74 = add i64 %indvar55, 1
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %2, i64 %74, i64 0
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %2, i64 %74, i64 999
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %3, i64 %74, i64 0
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %3, i64 %74, i64 999
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 0
  store double 1.000000e+00, double* %75, align 8
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 0
  store double 0.000000e+00, double* %76, align 8
  %77 = bitcast double* %75 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37
  %80 = bitcast [1000 x double]* %79 to i64*
  store i64 %78, i64* %80, align 8
  %81 = add nsw i64 %indvars.iv37, -1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %bound065 = icmp ult double* %scevgep57, %scevgep63
  %bound166 = icmp ult double* %scevgep61, %scevgep59
  %memcheck.conflict68 = and i1 %bound065, %bound166
  br i1 %memcheck.conflict68, label %._crit_edge42.lver.orig.preheader, label %._crit_edge42.ph

._crit_edge42.lver.orig.preheader:                ; preds = %._crit_edge42.lver.check
  br label %._crit_edge42.lver.orig

._crit_edge42.lver.orig:                          ; preds = %._crit_edge42.lver.orig.preheader, %._crit_edge42.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %._crit_edge42.lver.orig ], [ 1, %._crit_edge42.lver.orig.preheader ]
  %82 = add nsw i64 %indvars.iv31.lver.orig, -1
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %82
  %84 = load double, double* %83, align 8
  %85 = fmul double %84, 0xC08F400000000001
  %86 = fadd double %85, 0x409F440000000001
  %87 = fdiv double 0x408F400000000001, %86
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %87, double* %88, align 8
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %81, i64 %indvars.iv31.lver.orig
  %90 = load double, double* %89, align 8
  %91 = fmul double %90, 0xC09F400000000001
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  %93 = load double, double* %92, align 8
  %94 = fmul double %93, 0xC0AF3E0000000001
  %95 = fsub double %94, %91
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next38, i64 %indvars.iv31.lver.orig
  %97 = load double, double* %96, align 8
  %98 = fmul double %97, 0xC09F400000000001
  %99 = fsub double %95, %98
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %82
  %101 = load double, double* %100, align 8
  %102 = fmul double %101, 0xC08F400000000001
  %103 = fsub double %99, %102
  %104 = fdiv double %103, %86
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %104, double* %105, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, 999
  br i1 %exitcond34.lver.orig, label %._crit_edge15.us.loopexit, label %._crit_edge42.lver.orig

._crit_edge42.ph:                                 ; preds = %._crit_edge42.lver.check
  %scevgep72 = getelementptr [1000 x double], [1000 x double]* %3, i64 %73, i64 0
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %2, i64 %73, i64 0
  %load_initial70 = load double, double* %scevgep69, align 8
  %load_initial73 = load double, double* %scevgep72, align 8
  br label %._crit_edge42

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond43 = icmp eq i64 %indvars.iv.next38, 999
  %indvar.next56 = add i64 %indvar55, 1
  br i1 %exitcond43, label %._crit_edge22, label %._crit_edge42.lver.check

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %._crit_edge15.us
  %indvars.iv35 = phi i64 [ 998, %._crit_edge15.us ], [ %indvars.iv.next36.1, %.lr.ph18.us ]
  %106 = phi double [ 1.000000e+00, %._crit_edge15.us ], [ %119, %.lr.ph18.us ]
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv35
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %106
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv35
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv35
  store double %112, double* %113, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next36
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, %112
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next36
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv.next36
  store double %119, double* %120, align 8
  %121 = icmp sgt i64 %indvars.iv.next36, 1
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  br i1 %121, label %.lr.ph18.us, label %._crit_edge19.us

._crit_edge42:                                    ; preds = %._crit_edge42, %._crit_edge42.ph
  %store_forwarded74 = phi double [ %load_initial73, %._crit_edge42.ph ], [ %139, %._crit_edge42 ]
  %store_forwarded71 = phi double [ %load_initial70, %._crit_edge42.ph ], [ %124, %._crit_edge42 ]
  %indvars.iv31 = phi i64 [ 1, %._crit_edge42.ph ], [ %indvars.iv.next32, %._crit_edge42 ]
  %122 = fmul double %store_forwarded71, 0xC08F400000000001
  %123 = fadd double %122, 0x409F440000000001
  %124 = fdiv double 0x408F400000000001, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv31
  store double %124, double* %125, align 8
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %81, i64 %indvars.iv31
  %127 = load double, double* %126, align 8
  %128 = fmul double %127, 0xC09F400000000001
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv31
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, 0xC0AF3E0000000001
  %132 = fsub double %131, %128
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next38, i64 %indvars.iv31
  %134 = load double, double* %133, align 8
  %135 = fmul double %134, 0xC09F400000000001
  %136 = fsub double %132, %135
  %137 = fmul double %store_forwarded74, 0xC08F400000000001
  %138 = fsub double %136, %137
  %139 = fdiv double %138, %123
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31
  store double %139, double* %140, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond34, label %._crit_edge15.us.loopexit75, label %._crit_edge42

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge42.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit75:                      ; preds = %._crit_edge42
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit75, %._crit_edge15.us.loopexit
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 999
  store double 1.000000e+00, double* %141, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %exitcond41 = icmp eq i32 %.0323, 500
  %142 = add nuw nsw i32 %.0323, 1
  br i1 %exitcond41, label %._crit_edge24, label %.preheader4

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv5, 1000
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
