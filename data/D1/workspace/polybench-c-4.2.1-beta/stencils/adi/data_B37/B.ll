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
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
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
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %15, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %15 ]
  %3 = add nuw nsw i64 %indvars.iv4, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %4 = sub nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %3, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %16, label %._crit_edge.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %156, %6
  %.0311 = phi i32 [ 1, %6 ], [ %157, %156 ]
  br label %._crit_edge26.lver.check

._crit_edge26.lver.check:                         ; preds = %._crit_edge, %._crit_edge.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge ], [ 0, %._crit_edge.preheader ]
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge ], [ 1, %._crit_edge.preheader ]
  %7 = add i64 %indvar, 1
  %8 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 0
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 999
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 999
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv14
  store double 1.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 0
  store double 0.000000e+00, double* %10, align 8
  %11 = bitcast double* %9 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14
  %14 = bitcast [1000 x double]* %13 to i64*
  store i64 %12, i64* %14, align 8
  %15 = add nsw i64 %indvars.iv14, -1
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %bound0 = icmp ult double* %scevgep, %scevgep35
  %bound1 = icmp ult double* %scevgep33, %scevgep31
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge26.lver.orig.preheader, label %._crit_edge26.ph

._crit_edge26.lver.orig.preheader:                ; preds = %._crit_edge26.lver.check
  br label %._crit_edge26.lver.orig

._crit_edge26.lver.orig:                          ; preds = %._crit_edge26.lver.orig.preheader, %._crit_edge26.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge26.lver.orig ], [ 1, %._crit_edge26.lver.orig.preheader ]
  %16 = add nsw i64 %indvars.iv.lver.orig, -1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %16
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv.lver.orig
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %15
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next15
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %16
  %.lhs.lver.orig = fmul double %18, 0xC09F400000000001
  %23 = fadd double %.lhs.lver.orig, 0x40AF420000000001
  %24 = fdiv double 0x409F400000000001, %23
  store double %24, double* %19, align 8
  %25 = bitcast double* %20 to <2 x double>*
  %26 = load <2 x double>, <2 x double>* %25, align 8
  %27 = fmul <2 x double> %26, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fadd double %28, %29
  %31 = load double, double* %21, align 8
  %32 = fmul double %31, 0xC08F400000000001
  %33 = fsub double %30, %32
  %34 = load double, double* %22, align 8
  %35 = fmul double %34, 0xC09F400000000001
  %36 = fsub double %33, %35
  %37 = fdiv double %36, %23
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv.lver.orig
  store double %37, double* %38, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit62, label %._crit_edge26.lver.orig

._crit_edge26.ph:                                 ; preds = %._crit_edge26.lver.check
  %scevgep38 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %load_initial = load double, double* %scevgep37, align 8
  %load_initial39 = load double, double* %scevgep38, align 8
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26, %._crit_edge26.ph
  %store_forwarded40 = phi double [ %load_initial39, %._crit_edge26.ph ], [ %55, %._crit_edge26 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge26.ph ], [ %43, %._crit_edge26 ]
  %indvars.iv = phi i64 [ 1, %._crit_edge26.ph ], [ %indvars.iv.next, %._crit_edge26 ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %15
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next15
  %.lhs = fmul double %store_forwarded, 0xC09F400000000001
  %42 = fadd double %.lhs, 0x40AF420000000001
  %43 = fdiv double 0x409F400000000001, %42
  store double %43, double* %39, align 8
  %44 = bitcast double* %40 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %44, align 8
  %46 = fmul <2 x double> %45, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %47 = extractelement <2 x double> %46, i32 0
  %48 = extractelement <2 x double> %46, i32 1
  %49 = fadd double %47, %48
  %50 = load double, double* %41, align 8
  %51 = fmul double %50, 0xC08F400000000001
  %52 = fsub double %49, %51
  %53 = fmul double %store_forwarded40, 0xC09F400000000001
  %54 = fsub double %52, %53
  %55 = fdiv double %54, %42
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv
  store double %55, double* %56, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.loopexit63, label %._crit_edge26

.loopexit62:                                      ; preds = %._crit_edge26.lver.orig
  br label %57

.loopexit63:                                      ; preds = %._crit_edge26
  br label %57

; <label>:57:                                     ; preds = %.loopexit63, %.loopexit62
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv14
  store double 1.000000e+00, double* %58, align 8
  br label %59

; <label>:59:                                     ; preds = %59, %57
  %indvars.iv12 = phi i64 [ 998, %57 ], [ %indvars.iv.next13.1, %59 ]
  %60 = phi double [ 1.000000e+00, %57 ], [ %73, %59 ]
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv12
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %60
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv12
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv14
  store double %66, double* %67, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, -1
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv.next13
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %66
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv.next13
  %72 = load double, double* %71, align 8
  %73 = fadd double %70, %72
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next13, i64 %indvars.iv14
  store double %73, double* %74, align 8
  %75 = icmp sgt i64 %indvars.iv.next13, 1
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, -2
  br i1 %75, label %59, label %._crit_edge

._crit_edge:                                      ; preds = %59
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond16, label %._crit_edge28.lver.check.preheader, label %._crit_edge26.lver.check

._crit_edge28.lver.check.preheader:               ; preds = %._crit_edge
  br label %._crit_edge28.lver.check

._crit_edge28.lver.check:                         ; preds = %._crit_edge28.lver.check.preheader, %._crit_edge4
  %indvar41 = phi i64 [ %indvar.next42, %._crit_edge4 ], [ 0, %._crit_edge28.lver.check.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge4 ], [ 1, %._crit_edge28.lver.check.preheader ]
  %76 = add i64 %indvar41, 1
  %77 = add i64 %indvar41, 1
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %4, i64 %77, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %4, i64 %77, i64 999
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %5, i64 %77, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %5, i64 %77, i64 999
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv22
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %78, i64 0, i64 0
  store double 1.000000e+00, double* %79, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 0
  store double 0.000000e+00, double* %80, align 8
  %81 = bitcast [1000 x double]* %78 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22
  %84 = bitcast [1000 x double]* %83 to i64*
  store i64 %82, i64* %84, align 8
  %85 = add nsw i64 %indvars.iv22, -1
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %bound051 = icmp ult double* %scevgep43, %scevgep49
  %bound152 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict54 = and i1 %bound051, %bound152
  br i1 %memcheck.conflict54, label %._crit_edge28.lver.orig.preheader, label %._crit_edge28.ph

._crit_edge28.lver.orig.preheader:                ; preds = %._crit_edge28.lver.check
  br label %._crit_edge28.lver.orig

._crit_edge28.lver.orig:                          ; preds = %._crit_edge28.lver.orig.preheader, %._crit_edge28.lver.orig
  %indvars.iv17.lver.orig = phi i64 [ %indvars.iv.next18.lver.orig, %._crit_edge28.lver.orig ], [ 1, %._crit_edge28.lver.orig.preheader ]
  %86 = add nsw i64 %indvars.iv17.lver.orig, -1
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %86
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv17.lver.orig
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %85, i64 %indvars.iv17.lver.orig
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv17.lver.orig
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next23, i64 %indvars.iv17.lver.orig
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %86
  %94 = insertelement <2 x double> undef, double %88, i32 0
  %95 = shufflevector <2 x double> %94, <2 x double> undef, <2 x i32> zeroinitializer
  %96 = fmul <2 x double> %95, <double 0xC08F400000000001, double 0xC08F400000000001>
  %97 = fadd <2 x double> %96, <double 0x409F440000000001, double 0x409F440000000001>
  %98 = extractelement <2 x double> %97, i32 0
  %99 = extractelement <2 x double> %97, i32 1
  %100 = fdiv double 0x408F400000000001, %98
  store double %100, double* %89, align 8
  %101 = load double, double* %90, align 8
  %102 = fmul double %101, 0x409F400000000001
  %103 = load double, double* %91, align 8
  %104 = fmul double %103, 0xC0AF3E0000000001
  %105 = fadd double %102, %104
  %106 = load double, double* %92, align 8
  %107 = fmul double %106, 0xC09F400000000001
  %108 = fsub double %105, %107
  %109 = load double, double* %93, align 8
  %110 = fmul double %109, 0xC08F400000000001
  %111 = fsub double %108, %110
  %112 = fdiv double %111, %99
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv17.lver.orig
  store double %112, double* %113, align 8
  %indvars.iv.next18.lver.orig = add nuw nsw i64 %indvars.iv17.lver.orig, 1
  %exitcond19.lver.orig = icmp eq i64 %indvars.iv.next18.lver.orig, 999
  br i1 %exitcond19.lver.orig, label %.loopexit, label %._crit_edge28.lver.orig

._crit_edge28.ph:                                 ; preds = %._crit_edge28.lver.check
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 %76, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %76, i64 0
  %load_initial56 = load double, double* %scevgep55, align 8
  %load_initial59 = load double, double* %scevgep58, align 8
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28, %._crit_edge28.ph
  %store_forwarded60 = phi double [ %load_initial59, %._crit_edge28.ph ], [ %135, %._crit_edge28 ]
  %store_forwarded57 = phi double [ %load_initial56, %._crit_edge28.ph ], [ %124, %._crit_edge28 ]
  %indvars.iv17 = phi i64 [ 1, %._crit_edge28.ph ], [ %indvars.iv.next18, %._crit_edge28 ]
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv17
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %85, i64 %indvars.iv17
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv17
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next23, i64 %indvars.iv17
  %118 = insertelement <2 x double> undef, double %store_forwarded57, i32 0
  %119 = shufflevector <2 x double> %118, <2 x double> undef, <2 x i32> zeroinitializer
  %120 = fmul <2 x double> %119, <double 0xC08F400000000001, double 0xC08F400000000001>
  %121 = fadd <2 x double> %120, <double 0x409F440000000001, double 0x409F440000000001>
  %122 = extractelement <2 x double> %121, i32 0
  %123 = extractelement <2 x double> %121, i32 1
  %124 = fdiv double 0x408F400000000001, %122
  store double %124, double* %114, align 8
  %125 = load double, double* %115, align 8
  %126 = fmul double %125, 0x409F400000000001
  %127 = load double, double* %116, align 8
  %128 = fmul double %127, 0xC0AF3E0000000001
  %129 = fadd double %126, %128
  %130 = load double, double* %117, align 8
  %131 = fmul double %130, 0xC09F400000000001
  %132 = fsub double %129, %131
  %133 = fmul double %store_forwarded60, 0xC08F400000000001
  %134 = fsub double %132, %133
  %135 = fdiv double %134, %123
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv17
  store double %135, double* %136, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 999
  br i1 %exitcond19, label %.loopexit61, label %._crit_edge28

.loopexit:                                        ; preds = %._crit_edge28.lver.orig
  br label %137

.loopexit61:                                      ; preds = %._crit_edge28
  br label %137

; <label>:137:                                    ; preds = %.loopexit61, %.loopexit
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv22, i64 999
  store double 1.000000e+00, double* %138, align 8
  br label %139

; <label>:139:                                    ; preds = %139, %137
  %indvars.iv20 = phi i64 [ 998, %137 ], [ %indvars.iv.next21.1, %139 ]
  %140 = phi double [ 1.000000e+00, %137 ], [ %153, %139 ]
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv20
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %140
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv20
  %145 = load double, double* %144, align 8
  %146 = fadd double %143, %145
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv20
  store double %146, double* %147, align 8
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, -1
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv.next21
  %149 = load double, double* %148, align 8
  %150 = fmul double %149, %146
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv.next21
  %152 = load double, double* %151, align 8
  %153 = fadd double %150, %152
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv.next21
  store double %153, double* %154, align 8
  %155 = icmp sgt i64 %indvars.iv.next21, 1
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, -2
  br i1 %155, label %139, label %._crit_edge4

._crit_edge4:                                     ; preds = %139
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 999
  %indvar.next42 = add i64 %indvar41, 1
  br i1 %exitcond24, label %156, label %._crit_edge28.lver.check

; <label>:156:                                    ; preds = %._crit_edge4
  %157 = add nuw nsw i32 %.0311, 1
  %exitcond25 = icmp eq i32 %157, 501
  br i1 %exitcond25, label %158, label %._crit_edge.preheader

; <label>:158:                                    ; preds = %156
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %18, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next6, %18 ]
  %7 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2

; <label>:12:                                     ; preds = %._crit_edge2._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %18, label %._crit_edge2._crit_edge

; <label>:18:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %19, label %._crit_edge.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
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
