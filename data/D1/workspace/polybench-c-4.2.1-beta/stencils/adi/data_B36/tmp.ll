; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call void @print_array(i32 1000, [1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [1000 x double]*) #0 {
  br label %.preheader

.preheader:                                       ; preds = %15, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %15 ]
  %3 = add nuw nsw i64 %indvars.iv4, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
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
  br i1 %exitcond6, label %16, label %.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) #0 {
  br label %.preheader4

.preheader4:                                      ; preds = %151, %6
  %.0311 = phi i32 [ 1, %6 ], [ %152, %151 ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %78, %.preheader4
  %indvar = phi i64 [ %indvar.next, %78 ], [ 0, %.preheader4 ]
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %78 ], [ 1, %.preheader4 ]
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
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %16 = add nsw i64 %indvars.iv.lver.orig, -1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %16
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, 0x409F400000000001
  %20 = fsub double 0x40AF420000000001, %19
  %21 = fdiv double 0x409F400000000001, %20
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv.lver.orig
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %15
  %24 = bitcast double* %23 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, <double 0x408F400000000001, double 0x409F3C0000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %27, %28
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next15
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, 0x408F400000000001
  %33 = fadd double %29, %32
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %16
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, 0x409F400000000001
  %37 = fadd double %33, %36
  %38 = fdiv double %37, %20
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv.lver.orig
  store double %38, double* %39, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit62, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %scevgep38 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %load_initial = load double, double* %scevgep37, align 8
  %load_initial39 = load double, double* %scevgep38, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded40 = phi double [ %load_initial39, %._crit_edge.ph ], [ %57, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %42, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %40 = fmul double %store_forwarded, 0x409F400000000001
  %41 = fsub double 0x40AF420000000001, %40
  %42 = fdiv double 0x409F400000000001, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv
  store double %42, double* %43, align 8
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %15
  %45 = bitcast double* %44 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %45, align 8
  %47 = fmul <2 x double> %46, <double 0x408F400000000001, double 0x409F3C0000000001>
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %50 = fsub double %48, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next15
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, 0x408F400000000001
  %54 = fadd double %50, %53
  %55 = fmul double %store_forwarded40, 0x409F400000000001
  %56 = fadd double %54, %55
  %57 = fdiv double %56, %41
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv
  store double %57, double* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.loopexit63, label %._crit_edge

.loopexit62:                                      ; preds = %._crit_edge.lver.orig
  br label %59

.loopexit63:                                      ; preds = %._crit_edge
  br label %59

; <label>:59:                                     ; preds = %.loopexit63, %.loopexit62
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv14
  store double 1.000000e+00, double* %60, align 8
  br label %61

; <label>:61:                                     ; preds = %61, %59
  %indvars.iv12 = phi i64 [ 998, %59 ], [ %indvars.iv.next13.1, %61 ]
  %62 = phi double [ 1.000000e+00, %59 ], [ %75, %61 ]
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv12
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %62
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv12
  %67 = load double, double* %66, align 8
  %68 = fadd double %65, %67
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv14
  store double %68, double* %69, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, -1
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv.next13
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %68
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv.next13
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next13, i64 %indvars.iv14
  store double %75, double* %76, align 8
  %77 = icmp sgt i64 %indvars.iv.next13, 1
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, -2
  br i1 %77, label %61, label %78

; <label>:78:                                     ; preds = %61
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond16, label %._crit_edge28.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge28.lver.check.preheader:               ; preds = %78
  br label %._crit_edge28.lver.check

._crit_edge28.lver.check:                         ; preds = %._crit_edge28.lver.check.preheader, %150
  %indvar41 = phi i64 [ %indvar.next42, %150 ], [ 0, %._crit_edge28.lver.check.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %150 ], [ 1, %._crit_edge28.lver.check.preheader ]
  %79 = add i64 %indvar41, 1
  %80 = add i64 %indvar41, 1
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %4, i64 %80, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %4, i64 %80, i64 999
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %5, i64 %80, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %5, i64 %80, i64 999
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv22, i64 0
  store double 1.000000e+00, double* %81, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 0
  store double 0.000000e+00, double* %82, align 8
  %83 = bitcast double* %81 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22
  %86 = bitcast [1000 x double]* %85 to i64*
  store i64 %84, i64* %86, align 8
  %87 = add nsw i64 %indvars.iv22, -1
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %bound051 = icmp ult double* %scevgep43, %scevgep49
  %bound152 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict54 = and i1 %bound051, %bound152
  br i1 %memcheck.conflict54, label %._crit_edge28.lver.orig.preheader, label %._crit_edge28.ph

._crit_edge28.lver.orig.preheader:                ; preds = %._crit_edge28.lver.check
  br label %._crit_edge28.lver.orig

._crit_edge28.lver.orig:                          ; preds = %._crit_edge28.lver.orig.preheader, %._crit_edge28.lver.orig
  %indvars.iv17.lver.orig = phi i64 [ %indvars.iv.next18.lver.orig, %._crit_edge28.lver.orig ], [ 1, %._crit_edge28.lver.orig.preheader ]
  %88 = add nsw i64 %indvars.iv17.lver.orig, -1
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %88
  %90 = load double, double* %89, align 8
  %91 = fmul double %90, 0x408F400000000001
  %92 = fsub double 0x409F440000000001, %91
  %93 = fdiv double 0x408F400000000001, %92
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv17.lver.orig
  store double %93, double* %94, align 8
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv17.lver.orig
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, 0x409F400000000001
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv17.lver.orig
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, 0x40AF3E0000000001
  %101 = fsub double %97, %100
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next23, i64 %indvars.iv17.lver.orig
  %103 = load double, double* %102, align 8
  %104 = fmul double %103, 0x409F400000000001
  %105 = fadd double %101, %104
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %88
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, 0x408F400000000001
  %109 = fadd double %105, %108
  %110 = fdiv double %109, %92
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv17.lver.orig
  store double %110, double* %111, align 8
  %indvars.iv.next18.lver.orig = add nuw nsw i64 %indvars.iv17.lver.orig, 1
  %exitcond19.lver.orig = icmp eq i64 %indvars.iv.next18.lver.orig, 999
  br i1 %exitcond19.lver.orig, label %.loopexit, label %._crit_edge28.lver.orig

._crit_edge28.ph:                                 ; preds = %._crit_edge28.lver.check
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 0
  %load_initial56 = load double, double* %scevgep55, align 8
  %load_initial59 = load double, double* %scevgep58, align 8
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28, %._crit_edge28.ph
  %store_forwarded60 = phi double [ %load_initial59, %._crit_edge28.ph ], [ %129, %._crit_edge28 ]
  %store_forwarded57 = phi double [ %load_initial56, %._crit_edge28.ph ], [ %114, %._crit_edge28 ]
  %indvars.iv17 = phi i64 [ 1, %._crit_edge28.ph ], [ %indvars.iv.next18, %._crit_edge28 ]
  %112 = fmul double %store_forwarded57, 0x408F400000000001
  %113 = fsub double 0x409F440000000001, %112
  %114 = fdiv double 0x408F400000000001, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv17
  store double %114, double* %115, align 8
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv17
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, 0x409F400000000001
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv17
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, 0x40AF3E0000000001
  %122 = fsub double %118, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next23, i64 %indvars.iv17
  %124 = load double, double* %123, align 8
  %125 = fmul double %124, 0x409F400000000001
  %126 = fadd double %122, %125
  %127 = fmul double %store_forwarded60, 0x408F400000000001
  %128 = fadd double %126, %127
  %129 = fdiv double %128, %113
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv17
  store double %129, double* %130, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 999
  br i1 %exitcond19, label %.loopexit61, label %._crit_edge28

.loopexit:                                        ; preds = %._crit_edge28.lver.orig
  br label %131

.loopexit61:                                      ; preds = %._crit_edge28
  br label %131

; <label>:131:                                    ; preds = %.loopexit61, %.loopexit
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv22, i64 999
  store double 1.000000e+00, double* %132, align 8
  br label %133

; <label>:133:                                    ; preds = %133, %131
  %indvars.iv20 = phi i64 [ 998, %131 ], [ %indvars.iv.next21.1, %133 ]
  %134 = phi double [ 1.000000e+00, %131 ], [ %147, %133 ]
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv20
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %134
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv20
  %139 = load double, double* %138, align 8
  %140 = fadd double %137, %139
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv20
  store double %140, double* %141, align 8
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, -1
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv.next21
  %143 = load double, double* %142, align 8
  %144 = fmul double %143, %140
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv.next21
  %146 = load double, double* %145, align 8
  %147 = fadd double %144, %146
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv.next21
  store double %147, double* %148, align 8
  %149 = icmp sgt i64 %indvars.iv.next21, 1
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, -2
  br i1 %149, label %133, label %150

; <label>:150:                                    ; preds = %133
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 999
  %indvar.next42 = add i64 %indvar41, 1
  br i1 %exitcond24, label %151, label %._crit_edge28.lver.check

; <label>:151:                                    ; preds = %150
  %152 = add nuw nsw i32 %.0311, 1
  %exitcond25 = icmp eq i32 %152, 501
  br i1 %exitcond25, label %153, label %.preheader4

; <label>:153:                                    ; preds = %151
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1000 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %18 ]
  %7 = mul nuw nsw i64 %indvars.iv4, 1000
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %18, label %._crit_edge7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
