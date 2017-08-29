; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [1000 x double]* nocapture) #2 {
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
  br label %.preheader7

.preheader7:                                      ; preds = %149, %6
  %storemerge14 = phi i32 [ 1, %6 ], [ %150, %149 ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %77, %.preheader7
  %indvar = phi i64 [ %indvar.next, %77 ], [ 0, %.preheader7 ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %77 ], [ 1, %.preheader7 ]
  %7 = add nuw nsw i64 %indvar, 1
  %8 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 0
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 999
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  %scevgep39 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 999
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv17
  store double 1.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv17, i64 0
  store double 0.000000e+00, double* %10, align 8
  %11 = bitcast double* %9 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv17
  %14 = bitcast [1000 x double]* %13 to i64*
  store i64 %12, i64* %14, align 8
  %15 = add nsw i64 %indvars.iv17, -1
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %bound0 = icmp ult double* %scevgep, %scevgep39
  %bound1 = icmp ult double* %scevgep37, %scevgep35
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %16 = add nsw i64 %indvars.iv.lver.orig, -1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv17, i64 %16
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, 0xC09F400000000001
  %20 = fadd double %19, 0x40AF420000000001
  %21 = fdiv double 0x409F400000000001, %20
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv.lver.orig
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %15
  %24 = bitcast double* %23 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %28, %27
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next18
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, 0xC08F400000000001
  %33 = fsub double %29, %32
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv17, i64 %16
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, 0xC09F400000000001
  %37 = fsub double %33, %36
  %38 = fdiv double %37, %20
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv17, i64 %indvars.iv.lver.orig
  store double %38, double* %39, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit66.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %scevgep42 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep41 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %load_initial = load double, double* %scevgep41, align 8
  %load_initial43 = load double, double* %scevgep42, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded44 = phi double [ %load_initial43, %._crit_edge.ph ], [ %57, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %42, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %40 = fmul double %store_forwarded, 0xC09F400000000001
  %41 = fadd double %40, 0x40AF420000000001
  %42 = fdiv double 0x409F400000000001, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv
  store double %42, double* %43, align 8
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %15
  %45 = bitcast double* %44 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %45, align 8
  %47 = fmul <2 x double> %46, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %50 = fsub double %49, %48
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next18
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, 0xC08F400000000001
  %54 = fsub double %50, %53
  %55 = fmul double %store_forwarded44, 0xC09F400000000001
  %56 = fsub double %54, %55
  %57 = fdiv double %56, %41
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv17, i64 %indvars.iv
  store double %57, double* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.loopexit66.loopexit69, label %._crit_edge

.loopexit66.loopexit:                             ; preds = %._crit_edge.lver.orig
  br label %.loopexit66

.loopexit66.loopexit69:                           ; preds = %._crit_edge
  br label %.loopexit66

.loopexit66:                                      ; preds = %.loopexit66.loopexit69, %.loopexit66.loopexit
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv17
  store double 1.000000e+00, double* %59, align 8
  br label %60

; <label>:60:                                     ; preds = %60, %.loopexit66
  %indvars.iv15 = phi i64 [ 998, %.loopexit66 ], [ %indvars.iv.next16.1, %60 ]
  %61 = phi double [ 1.000000e+00, %.loopexit66 ], [ %74, %60 ]
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv15
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %61
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv17, i64 %indvars.iv15
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv15, i64 %indvars.iv17
  store double %67, double* %68, align 8
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, -1
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv.next16
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %67
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv17, i64 %indvars.iv.next16
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next16, i64 %indvars.iv17
  store double %74, double* %75, align 8
  %76 = icmp sgt i64 %indvars.iv.next16, 1
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, -2
  br i1 %76, label %60, label %77

; <label>:77:                                     ; preds = %60
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 999
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond19, label %._crit_edge31.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge31.lver.check.preheader:               ; preds = %77
  br label %._crit_edge31.lver.check

._crit_edge31.lver.check:                         ; preds = %._crit_edge31.lver.check.preheader, %148
  %indvar45 = phi i64 [ %indvar.next46, %148 ], [ 0, %._crit_edge31.lver.check.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %148 ], [ 1, %._crit_edge31.lver.check.preheader ]
  %78 = add nuw nsw i64 %indvar45, 1
  %79 = add nuw nsw i64 %indvar45, 1
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 999
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 0
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 999
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 0
  store double 1.000000e+00, double* %80, align 8
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv25, i64 0
  store double 0.000000e+00, double* %81, align 8
  %82 = bitcast double* %80 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25
  %85 = bitcast [1000 x double]* %84 to i64*
  store i64 %83, i64* %85, align 8
  %86 = add nsw i64 %indvars.iv25, -1
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %bound055 = icmp ult double* %scevgep47, %scevgep53
  %bound156 = icmp ult double* %scevgep51, %scevgep49
  %memcheck.conflict58 = and i1 %bound055, %bound156
  br i1 %memcheck.conflict58, label %._crit_edge31.lver.orig.preheader, label %._crit_edge31.ph

._crit_edge31.lver.orig.preheader:                ; preds = %._crit_edge31.lver.check
  br label %._crit_edge31.lver.orig

._crit_edge31.lver.orig:                          ; preds = %._crit_edge31.lver.orig.preheader, %._crit_edge31.lver.orig
  %indvars.iv20.lver.orig = phi i64 [ %indvars.iv.next21.lver.orig, %._crit_edge31.lver.orig ], [ 1, %._crit_edge31.lver.orig.preheader ]
  %87 = add nsw i64 %indvars.iv20.lver.orig, -1
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv25, i64 %87
  %89 = load double, double* %88, align 8
  %90 = fmul double %89, 0xC08F400000000001
  %91 = fadd double %90, 0x409F440000000001
  %92 = fdiv double 0x408F400000000001, %91
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv20.lver.orig
  store double %92, double* %93, align 8
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %86, i64 %indvars.iv20.lver.orig
  %95 = load double, double* %94, align 8
  %96 = fmul double %95, 0xC09F400000000001
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv20.lver.orig
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, 0xC0AF3E0000000001
  %100 = fsub double %99, %96
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv20.lver.orig
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, 0xC09F400000000001
  %104 = fsub double %100, %103
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %87
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, 0xC08F400000000001
  %108 = fsub double %104, %107
  %109 = fdiv double %108, %91
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv20.lver.orig
  store double %109, double* %110, align 8
  %indvars.iv.next21.lver.orig = add nuw nsw i64 %indvars.iv20.lver.orig, 1
  %exitcond22.lver.orig = icmp eq i64 %indvars.iv.next21.lver.orig, 999
  br i1 %exitcond22.lver.orig, label %.loopexit.loopexit, label %._crit_edge31.lver.orig

._crit_edge31.ph:                                 ; preds = %._crit_edge31.lver.check
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %5, i64 %78, i64 0
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %4, i64 %78, i64 0
  %load_initial60 = load double, double* %scevgep59, align 8
  %load_initial63 = load double, double* %scevgep62, align 8
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31, %._crit_edge31.ph
  %store_forwarded64 = phi double [ %load_initial63, %._crit_edge31.ph ], [ %128, %._crit_edge31 ]
  %store_forwarded61 = phi double [ %load_initial60, %._crit_edge31.ph ], [ %113, %._crit_edge31 ]
  %indvars.iv20 = phi i64 [ 1, %._crit_edge31.ph ], [ %indvars.iv.next21, %._crit_edge31 ]
  %111 = fmul double %store_forwarded61, 0xC08F400000000001
  %112 = fadd double %111, 0x409F440000000001
  %113 = fdiv double 0x408F400000000001, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv20
  store double %113, double* %114, align 8
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %86, i64 %indvars.iv20
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, 0xC09F400000000001
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv20
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, 0xC0AF3E0000000001
  %121 = fsub double %120, %117
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv20
  %123 = load double, double* %122, align 8
  %124 = fmul double %123, 0xC09F400000000001
  %125 = fsub double %121, %124
  %126 = fmul double %store_forwarded64, 0xC08F400000000001
  %127 = fsub double %125, %126
  %128 = fdiv double %127, %112
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv20
  store double %128, double* %129, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 999
  br i1 %exitcond22, label %.loopexit.loopexit68, label %._crit_edge31

.loopexit.loopexit:                               ; preds = %._crit_edge31.lver.orig
  br label %.loopexit

.loopexit.loopexit68:                             ; preds = %._crit_edge31
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit68, %.loopexit.loopexit
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 999
  store double 1.000000e+00, double* %130, align 8
  br label %131

; <label>:131:                                    ; preds = %131, %.loopexit
  %indvars.iv23 = phi i64 [ 998, %.loopexit ], [ %indvars.iv.next24.1, %131 ]
  %132 = phi double [ 1.000000e+00, %.loopexit ], [ %145, %131 ]
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv23
  %134 = load double, double* %133, align 8
  %135 = fmul double %134, %132
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv23
  %137 = load double, double* %136, align 8
  %138 = fadd double %135, %137
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv23
  store double %138, double* %139, align 8
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, -1
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next24
  %141 = load double, double* %140, align 8
  %142 = fmul double %141, %138
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv.next24
  %144 = load double, double* %143, align 8
  %145 = fadd double %142, %144
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next24
  store double %145, double* %146, align 8
  %147 = icmp sgt i64 %indvars.iv.next24, 1
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, -2
  br i1 %147, label %131, label %148

; <label>:148:                                    ; preds = %131
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 999
  %indvar.next46 = add nuw nsw i64 %indvar45, 1
  br i1 %exitcond27, label %149, label %._crit_edge31.lver.check

; <label>:149:                                    ; preds = %148
  %150 = add nuw nsw i32 %storemerge14, 1
  %exitcond28 = icmp eq i32 %150, 501
  br i1 %exitcond28, label %151, label %.preheader7

; <label>:151:                                    ; preds = %149
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1000 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %18, label %._crit_edge7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
