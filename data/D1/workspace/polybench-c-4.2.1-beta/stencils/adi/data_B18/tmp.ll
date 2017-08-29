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
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge._crit_edge.us ]
  %1 = add i64 %indvars.iv5, 1000
  %2 = trunc i64 %1 to i32
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next.1, %._crit_edge.us ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = sub nuw nsw i32 %2, %3
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %7 = trunc i64 %indvars.iv to i32
  %8 = or i32 %7, 1
  %9 = sub nuw nsw i32 %2, %8
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %5, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %6 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %._crit_edge.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge4._crit_edge, %._crit_edge.preheader.lr.ph
  %.0324 = phi i32 [ 1, %._crit_edge.preheader.lr.ph ], [ %143, %._crit_edge4._crit_edge ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %._crit_edge.preheader, %._crit_edge.us
  %indvar = phi i64 [ 0, %._crit_edge.preheader ], [ %indvar.next, %._crit_edge.us ]
  %indvars.iv28 = phi i64 [ 1, %._crit_edge.preheader ], [ %indvars.iv.next29, %._crit_edge.us ]
  %4 = add i64 %indvar, 1
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv28
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv28, -1
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %bound0 = icmp ult double* %scevgep, %scevgep49
  %bound1 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %13
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, 0xC09F400000000001
  %17 = fadd double %16, 0x40AF420000000001
  %18 = fdiv double 0x409F400000000001, %17
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %21 = bitcast double* %20 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %23 = fmul <2 x double> %22, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %26 = fsub double %25, %24
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next29
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %26, %29
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %13
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = fsub double %30, %33
  %35 = fdiv double %34, %17
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  store double %35, double* %36, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge7.us.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %scevgep52 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %load_initial = load double, double* %scevgep51, align 8
  %load_initial53 = load double, double* %scevgep52, align 8
  br label %._crit_edge

._crit_edge.us:                                   ; preds = %.lr.ph10.us
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond31, label %._crit_edge43.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge43.lver.check.preheader:               ; preds = %._crit_edge.us
  br label %._crit_edge43.lver.check

.lr.ph10.us:                                      ; preds = %.lr.ph10.us, %._crit_edge7.us
  %indvars.iv26 = phi i64 [ 998, %._crit_edge7.us ], [ %indvars.iv.next27.1, %.lr.ph10.us ]
  %37 = phi double [ 1.000000e+00, %._crit_edge7.us ], [ %50, %.lr.ph10.us ]
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv26
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %37
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv26
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv28
  store double %43, double* %44, align 8
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.next27
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %43
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv.next27
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next27, i64 %indvars.iv28
  store double %50, double* %51, align 8
  %52 = icmp sgt i64 %indvars.iv.next27, 1
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, -2
  br i1 %52, label %.lr.ph10.us, label %._crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded54 = phi double [ %load_initial53, %._crit_edge.ph ], [ %70, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %55, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %53 = fmul double %store_forwarded, 0xC09F400000000001
  %54 = fadd double %53, 0x40AF420000000001
  %55 = fdiv double 0x409F400000000001, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv
  store double %55, double* %56, align 8
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %58 = bitcast double* %57 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 8
  %60 = fmul <2 x double> %59, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fsub double %62, %61
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next29
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, 0xC08F400000000001
  %67 = fsub double %63, %66
  %68 = fmul double %store_forwarded54, 0xC09F400000000001
  %69 = fsub double %67, %68
  %70 = fdiv double %69, %54
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv
  store double %70, double* %71, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge7.us.loopexit2, label %._crit_edge

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge.lver.orig
  br label %._crit_edge7.us

._crit_edge7.us.loopexit2:                        ; preds = %._crit_edge
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit2, %._crit_edge7.us.loopexit
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv28
  store double 1.000000e+00, double* %72, align 8
  br label %.lr.ph10.us

._crit_edge43.lver.check:                         ; preds = %._crit_edge43.lver.check.preheader, %._crit_edge4.us
  %indvar55 = phi i64 [ %indvar.next56, %._crit_edge4.us ], [ 0, %._crit_edge43.lver.check.preheader ]
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge4.us ], [ 1, %._crit_edge43.lver.check.preheader ]
  %73 = add i64 %indvar55, 1
  %74 = add i64 %indvar55, 1
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %2, i64 %74, i64 0
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %2, i64 %74, i64 999
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %3, i64 %74, i64 0
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %3, i64 %74, i64 999
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv38
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 0, i64 0
  store double 1.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 0
  store double 0.000000e+00, double* %77, align 8
  %78 = bitcast [1000 x double]* %75 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38
  %81 = bitcast [1000 x double]* %80 to i64*
  store i64 %79, i64* %81, align 8
  %82 = add nsw i64 %indvars.iv38, -1
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %bound065 = icmp ult double* %scevgep57, %scevgep63
  %bound166 = icmp ult double* %scevgep61, %scevgep59
  %memcheck.conflict68 = and i1 %bound065, %bound166
  br i1 %memcheck.conflict68, label %._crit_edge43.lver.orig.preheader, label %._crit_edge43.ph

._crit_edge43.lver.orig.preheader:                ; preds = %._crit_edge43.lver.check
  br label %._crit_edge43.lver.orig

._crit_edge43.lver.orig:                          ; preds = %._crit_edge43.lver.orig.preheader, %._crit_edge43.lver.orig
  %indvars.iv32.lver.orig = phi i64 [ %indvars.iv.next33.lver.orig, %._crit_edge43.lver.orig ], [ 1, %._crit_edge43.lver.orig.preheader ]
  %83 = add nsw i64 %indvars.iv32.lver.orig, -1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, 0xC08F400000000001
  %87 = fadd double %86, 0x409F440000000001
  %88 = fdiv double 0x408F400000000001, %87
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  store double %88, double* %89, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv32.lver.orig
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, 0xC09F400000000001
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, 0xC0AF3E0000000001
  %96 = fsub double %95, %92
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next39, i64 %indvars.iv32.lver.orig
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, 0xC09F400000000001
  %100 = fsub double %96, %99
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %83
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, 0xC08F400000000001
  %104 = fsub double %100, %103
  %105 = fdiv double %104, %87
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  store double %105, double* %106, align 8
  %indvars.iv.next33.lver.orig = add nuw nsw i64 %indvars.iv32.lver.orig, 1
  %exitcond35.lver.orig = icmp eq i64 %indvars.iv.next33.lver.orig, 999
  br i1 %exitcond35.lver.orig, label %._crit_edge17.us.loopexit, label %._crit_edge43.lver.orig

._crit_edge43.ph:                                 ; preds = %._crit_edge43.lver.check
  %scevgep72 = getelementptr [1000 x double], [1000 x double]* %3, i64 %73, i64 0
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %2, i64 %73, i64 0
  %load_initial70 = load double, double* %scevgep69, align 8
  %load_initial73 = load double, double* %scevgep72, align 8
  br label %._crit_edge43

._crit_edge4.us:                                  ; preds = %.lr.ph20.us
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 999
  %indvar.next56 = add i64 %indvar55, 1
  br i1 %exitcond41, label %._crit_edge4._crit_edge, label %._crit_edge43.lver.check

.lr.ph20.us:                                      ; preds = %.lr.ph20.us, %._crit_edge17.us
  %indvars.iv36 = phi i64 [ 998, %._crit_edge17.us ], [ %indvars.iv.next37.1, %.lr.ph20.us ]
  %107 = phi double [ 1.000000e+00, %._crit_edge17.us ], [ %120, %.lr.ph20.us ]
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv36
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, %107
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv36
  %112 = load double, double* %111, align 8
  %113 = fadd double %110, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv36
  store double %113, double* %114, align 8
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, -1
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next37
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, %113
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv.next37
  %119 = load double, double* %118, align 8
  %120 = fadd double %117, %119
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv.next37
  store double %120, double* %121, align 8
  %122 = icmp sgt i64 %indvars.iv.next37, 1
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, -2
  br i1 %122, label %.lr.ph20.us, label %._crit_edge4.us

._crit_edge43:                                    ; preds = %._crit_edge43, %._crit_edge43.ph
  %store_forwarded74 = phi double [ %load_initial73, %._crit_edge43.ph ], [ %140, %._crit_edge43 ]
  %store_forwarded71 = phi double [ %load_initial70, %._crit_edge43.ph ], [ %125, %._crit_edge43 ]
  %indvars.iv32 = phi i64 [ 1, %._crit_edge43.ph ], [ %indvars.iv.next33, %._crit_edge43 ]
  %123 = fmul double %store_forwarded71, 0xC08F400000000001
  %124 = fadd double %123, 0x409F440000000001
  %125 = fdiv double 0x408F400000000001, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv32
  store double %125, double* %126, align 8
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv32
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, 0xC09F400000000001
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv32
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, 0xC0AF3E0000000001
  %133 = fsub double %132, %129
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next39, i64 %indvars.iv32
  %135 = load double, double* %134, align 8
  %136 = fmul double %135, 0xC09F400000000001
  %137 = fsub double %133, %136
  %138 = fmul double %store_forwarded74, 0xC08F400000000001
  %139 = fsub double %137, %138
  %140 = fdiv double %139, %124
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv32
  store double %140, double* %141, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 999
  br i1 %exitcond35, label %._crit_edge17.us.loopexit1, label %._crit_edge43

._crit_edge17.us.loopexit:                        ; preds = %._crit_edge43.lver.orig
  br label %._crit_edge17.us

._crit_edge17.us.loopexit1:                       ; preds = %._crit_edge43
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit1, %._crit_edge17.us.loopexit
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv38, i64 999
  store double 1.000000e+00, double* %142, align 8
  br label %.lr.ph20.us

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4.us
  %exitcond42 = icmp eq i32 %.0324, 500
  %143 = add nuw nsw i32 %.0324, 1
  br i1 %exitcond42, label %._crit_edge25, label %._crit_edge.preheader

._crit_edge25:                                    ; preds = %._crit_edge4._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
._crit_edge.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv5, 1000
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge2.us

; <label>:10:                                     ; preds = %._crit_edge2.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge2.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge, label %._crit_edge.preheader.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
