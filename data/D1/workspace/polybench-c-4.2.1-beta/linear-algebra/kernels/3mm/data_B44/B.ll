; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #5
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #5
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #5
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #5
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #5
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #5
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %18
  tail call void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %22

; <label>:22:                                     ; preds = %18, %21, %2
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  tail call void @free(i8* %7) #5
  tail call void @free(i8* %8) #5
  tail call void @free(i8* %9) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, i32, [1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) #2 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader56.lr.ph, label %.preheader55

.preheader56.lr.ph:                               ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader56.us.preheader, label %.preheader53

.preheader56.us.preheader:                        ; preds = %.preheader56.lr.ph
  %wide.trip.count105 = zext i32 %2 to i64
  %wide.trip.count109 = zext i32 %0 to i64
  br label %.preheader56.us

.preheader56.us:                                  ; preds = %.preheader56.us.preheader, %._crit_edge73.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge73.us ], [ 0, %.preheader56.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader56.us
  %indvars.iv103 = phi i64 [ 0, %.preheader56.us ], [ %indvars.iv.next104, %14 ]
  %15 = mul nuw nsw i64 %indvars.iv103, %indvars.iv107
  %16 = add nuw nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %13
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv107, i64 %indvars.iv103
  store double %20, double* %21, align 8
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, %wide.trip.count105
  br i1 %exitcond106, label %._crit_edge73.us, label %14

._crit_edge73.us:                                 ; preds = %14
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, %wide.trip.count109
  br i1 %exitcond110, label %.preheader55.loopexit, label %.preheader56.us

.preheader55.loopexit:                            ; preds = %._crit_edge73.us
  br label %.preheader55

.preheader55:                                     ; preds = %.preheader55.loopexit, %9
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %.preheader54.lr.ph, label %.preheader53

.preheader54.lr.ph:                               ; preds = %.preheader55
  %23 = icmp sgt i32 %1, 0
  %24 = mul nsw i32 %1, 5
  %25 = sitofp i32 %24 to double
  br i1 %23, label %.preheader54.us.preheader, label %.preheader51

.preheader54.us.preheader:                        ; preds = %.preheader54.lr.ph
  %wide.trip.count96 = zext i32 %1 to i64
  %wide.trip.count100 = zext i32 %2 to i64
  br label %.preheader54.us

.preheader54.us:                                  ; preds = %.preheader54.us.preheader, %._crit_edge68.us
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %._crit_edge68.us ], [ 0, %.preheader54.us.preheader ]
  br label %26

; <label>:26:                                     ; preds = %26, %.preheader54.us
  %indvars.iv94 = phi i64 [ 0, %.preheader54.us ], [ %indvars.iv.next95, %26 ]
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %27 = mul nuw nsw i64 %indvars.iv.next95, %indvars.iv98
  %28 = add nuw nsw i64 %27, 2
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %1
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %25
  %33 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv98, i64 %indvars.iv94
  store double %32, double* %33, align 8
  %exitcond97 = icmp eq i64 %indvars.iv.next95, %wide.trip.count96
  br i1 %exitcond97, label %._crit_edge68.us, label %26

._crit_edge68.us:                                 ; preds = %26
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, %wide.trip.count100
  br i1 %exitcond101, label %.preheader53.loopexit, label %.preheader54.us

.preheader53.loopexit:                            ; preds = %._crit_edge68.us
  br label %.preheader53

.preheader53:                                     ; preds = %.preheader53.loopexit, %.preheader56.lr.ph, %.preheader55
  %34 = icmp sgt i32 %1, 0
  br i1 %34, label %.preheader52.lr.ph, label %.preheader51

.preheader52.lr.ph:                               ; preds = %.preheader53
  %35 = icmp sgt i32 %4, 0
  %36 = mul nsw i32 %3, 5
  %37 = sitofp i32 %36 to double
  br i1 %35, label %.preheader52.us.preheader, label %._crit_edge60

.preheader52.us.preheader:                        ; preds = %.preheader52.lr.ph
  %wide.trip.count87 = zext i32 %4 to i64
  %wide.trip.count91 = zext i32 %1 to i64
  br label %.preheader52.us

.preheader52.us:                                  ; preds = %.preheader52.us.preheader, %._crit_edge63.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge63.us ], [ 0, %.preheader52.us.preheader ]
  br label %38

; <label>:38:                                     ; preds = %38, %.preheader52.us
  %indvars.iv85 = phi i64 [ 0, %.preheader52.us ], [ %indvars.iv.next86, %38 ]
  %39 = add nuw nsw i64 %indvars.iv85, 3
  %40 = mul nuw nsw i64 %39, %indvars.iv89
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %3
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %37
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv89, i64 %indvars.iv85
  store double %44, double* %45, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, %wide.trip.count87
  br i1 %exitcond88, label %._crit_edge63.us, label %38

._crit_edge63.us:                                 ; preds = %38
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %.preheader51.loopexit, label %.preheader52.us

.preheader51.loopexit:                            ; preds = %._crit_edge63.us
  br label %.preheader51

.preheader51:                                     ; preds = %.preheader51.loopexit, %.preheader54.lr.ph, %.preheader53
  %46 = icmp sgt i32 %4, 0
  br i1 %46, label %.preheader.lr.ph, label %._crit_edge60

.preheader.lr.ph:                                 ; preds = %.preheader51
  %47 = icmp sgt i32 %3, 0
  %48 = mul nsw i32 %2, 5
  %49 = sitofp i32 %48 to double
  br i1 %47, label %.preheader.us.preheader, label %._crit_edge60

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count82 = zext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %50

; <label>:50:                                     ; preds = %50, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %50 ]
  %51 = add nuw nsw i64 %indvars.iv, 2
  %52 = mul nuw nsw i64 %51, %indvars.iv80
  %53 = add nuw nsw i64 %52, 2
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, %2
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, %49
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv80, i64 %indvars.iv
  store double %57, double* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %50

._crit_edge.us:                                   ; preds = %50
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83, label %._crit_edge60.loopexit, label %.preheader.us

._crit_edge60.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge60

._crit_edge60:                                    ; preds = %._crit_edge60.loopexit, %.preheader52.lr.ph, %.preheader.lr.ph, %.preheader51
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader71.lr.ph, label %.preheader70

.preheader71.lr.ph:                               ; preds = %12
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader71.us.preheader, label %.preheader.lr.ph

.preheader71.us.preheader:                        ; preds = %.preheader71.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %wide.trip.count176 = zext i32 %0 to i64
  %xtraiter166 = and i32 %2, 1
  %lcmp.mod167 = icmp eq i32 %xtraiter166, 0
  %20 = icmp eq i32 %2, 1
  %wide.trip.count170 = zext i32 %1 to i64
  %wide.trip.count162.1 = zext i32 %2 to i64
  br label %.preheader71.us

.preheader71.us:                                  ; preds = %._crit_edge104.us, %.preheader71.us.preheader
  %indvars.iv174 = phi i64 [ 0, %.preheader71.us.preheader ], [ %indvars.iv.next175, %._crit_edge104.us ]
  br i1 %15, label %.lr.ph100.us.us.preheader, label %._crit_edge104.us.loopexit116

.lr.ph100.us.us.preheader:                        ; preds = %.preheader71.us
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv174, i64 0
  br label %.lr.ph100.us.us

._crit_edge104.us.loopexit116:                    ; preds = %.preheader71.us
  %scevgep158 = getelementptr [900 x double], [900 x double]* %5, i64 %indvars.iv174, i64 0
  %scevgep158159 = bitcast double* %scevgep158 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep158159, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge104.us

._crit_edge104.us.loopexit:                       ; preds = %._crit_edge101.us.us
  br label %._crit_edge104.us

._crit_edge104.us:                                ; preds = %._crit_edge104.us.loopexit, %._crit_edge104.us.loopexit116
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next175, %wide.trip.count176
  br i1 %exitcond177, label %.preheader70.loopexit, label %.preheader71.us

.lr.ph100.us.us:                                  ; preds = %.lr.ph100.us.us.preheader, %._crit_edge101.us.us
  %indvars.iv168 = phi i64 [ %indvars.iv.next169, %._crit_edge101.us.us ], [ 0, %.lr.ph100.us.us.preheader ]
  %22 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv174, i64 %indvars.iv168
  store double 0.000000e+00, double* %22, align 8
  br i1 %lcmp.mod167, label %.prol.loopexit165, label %.prol.preheader164

.prol.preheader164:                               ; preds = %.lr.ph100.us.us
  %23 = load double, double* %21, align 8
  %24 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv168
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %22, align 8
  %28 = fadd double %27, %26
  store double %28, double* %22, align 8
  br label %.prol.loopexit165

.prol.loopexit165:                                ; preds = %.prol.preheader164, %.lr.ph100.us.us
  %indvars.iv160.unr.ph = phi i64 [ 1, %.prol.preheader164 ], [ 0, %.lr.ph100.us.us ]
  br i1 %20, label %._crit_edge101.us.us, label %.lr.ph100.us.us.new.preheader

.lr.ph100.us.us.new.preheader:                    ; preds = %.prol.loopexit165
  br label %.lr.ph100.us.us.new

._crit_edge101.us.us.loopexit:                    ; preds = %.lr.ph100.us.us.new
  br label %._crit_edge101.us.us

._crit_edge101.us.us:                             ; preds = %._crit_edge101.us.us.loopexit, %.prol.loopexit165
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond171 = icmp eq i64 %indvars.iv.next169, %wide.trip.count170
  br i1 %exitcond171, label %._crit_edge104.us.loopexit, label %.lr.ph100.us.us

.lr.ph100.us.us.new:                              ; preds = %.lr.ph100.us.us.new.preheader, %.lr.ph100.us.us.new
  %indvars.iv160 = phi i64 [ %indvars.iv.next161.1, %.lr.ph100.us.us.new ], [ %indvars.iv160.unr.ph, %.lr.ph100.us.us.new.preheader ]
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv174, i64 %indvars.iv160
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv160, i64 %indvars.iv168
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %22, align 8
  %35 = fadd double %34, %33
  store double %35, double* %22, align 8
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv174, i64 %indvars.iv.next161
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next161, i64 %indvars.iv168
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = load double, double* %22, align 8
  %42 = fadd double %41, %40
  store double %42, double* %22, align 8
  %indvars.iv.next161.1 = add nsw i64 %indvars.iv160, 2
  %exitcond163.1 = icmp eq i64 %indvars.iv.next161.1, %wide.trip.count162.1
  br i1 %exitcond163.1, label %._crit_edge101.us.us.loopexit, label %.lr.ph100.us.us.new

.preheader70.loopexit:                            ; preds = %._crit_edge104.us
  br label %.preheader70

.preheader70:                                     ; preds = %.preheader70.loopexit, %12
  %43 = icmp sgt i32 %1, 0
  br i1 %43, label %.preheader69.lr.ph, label %.preheader68

.preheader69.lr.ph:                               ; preds = %.preheader70
  %44 = icmp sgt i32 %3, 0
  %45 = icmp sgt i32 %4, 0
  br i1 %44, label %.preheader69.us.preheader, label %.preheader68

.preheader69.us.preheader:                        ; preds = %.preheader69.lr.ph
  %46 = add i32 %3, -1
  %47 = zext i32 %46 to i64
  %48 = shl nuw nsw i64 %47, 3
  %49 = add nuw nsw i64 %48, 8
  %wide.trip.count151 = zext i32 %1 to i64
  %xtraiter141 = and i32 %4, 1
  %lcmp.mod142 = icmp eq i32 %xtraiter141, 0
  %50 = icmp eq i32 %4, 1
  %wide.trip.count145 = zext i32 %3 to i64
  %wide.trip.count137.1 = zext i32 %4 to i64
  br label %.preheader69.us

.preheader69.us:                                  ; preds = %._crit_edge90.us, %.preheader69.us.preheader
  %indvars.iv149 = phi i64 [ 0, %.preheader69.us.preheader ], [ %indvars.iv.next150, %._crit_edge90.us ]
  br i1 %45, label %.lr.ph86.us.us.preheader, label %._crit_edge90.us.loopexit114

.lr.ph86.us.us.preheader:                         ; preds = %.preheader69.us
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv149, i64 0
  br label %.lr.ph86.us.us

._crit_edge90.us.loopexit114:                     ; preds = %.preheader69.us
  %scevgep133 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvars.iv149, i64 0
  %scevgep133134 = bitcast double* %scevgep133 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep133134, i8 0, i64 %49, i32 8, i1 false)
  br label %._crit_edge90.us

._crit_edge90.us.loopexit:                        ; preds = %._crit_edge87.us.us
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge90.us.loopexit, %._crit_edge90.us.loopexit114
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next150, %wide.trip.count151
  br i1 %exitcond152, label %.preheader68.loopexit, label %.preheader69.us

.lr.ph86.us.us:                                   ; preds = %.lr.ph86.us.us.preheader, %._crit_edge87.us.us
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge87.us.us ], [ 0, %.lr.ph86.us.us.preheader ]
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv149, i64 %indvars.iv143
  store double 0.000000e+00, double* %52, align 8
  br i1 %lcmp.mod142, label %.prol.loopexit140, label %.prol.preheader139

.prol.preheader139:                               ; preds = %.lr.ph86.us.us
  %53 = load double, double* %51, align 8
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv143
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = load double, double* %52, align 8
  %58 = fadd double %57, %56
  store double %58, double* %52, align 8
  br label %.prol.loopexit140

.prol.loopexit140:                                ; preds = %.prol.preheader139, %.lr.ph86.us.us
  %indvars.iv135.unr.ph = phi i64 [ 1, %.prol.preheader139 ], [ 0, %.lr.ph86.us.us ]
  br i1 %50, label %._crit_edge87.us.us, label %.lr.ph86.us.us.new.preheader

.lr.ph86.us.us.new.preheader:                     ; preds = %.prol.loopexit140
  br label %.lr.ph86.us.us.new

._crit_edge87.us.us.loopexit:                     ; preds = %.lr.ph86.us.us.new
  br label %._crit_edge87.us.us

._crit_edge87.us.us:                              ; preds = %._crit_edge87.us.us.loopexit, %.prol.loopexit140
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond146 = icmp eq i64 %indvars.iv.next144, %wide.trip.count145
  br i1 %exitcond146, label %._crit_edge90.us.loopexit, label %.lr.ph86.us.us

.lr.ph86.us.us.new:                               ; preds = %.lr.ph86.us.us.new.preheader, %.lr.ph86.us.us.new
  %indvars.iv135 = phi i64 [ %indvars.iv.next136.1, %.lr.ph86.us.us.new ], [ %indvars.iv135.unr.ph, %.lr.ph86.us.us.new.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv149, i64 %indvars.iv135
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv135, i64 %indvars.iv143
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = load double, double* %52, align 8
  %65 = fadd double %64, %63
  store double %65, double* %52, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv149, i64 %indvars.iv.next136
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next136, i64 %indvars.iv143
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = load double, double* %52, align 8
  %72 = fadd double %71, %70
  store double %72, double* %52, align 8
  %indvars.iv.next136.1 = add nsw i64 %indvars.iv135, 2
  %exitcond138.1 = icmp eq i64 %indvars.iv.next136.1, %wide.trip.count137.1
  br i1 %exitcond138.1, label %._crit_edge87.us.us.loopexit, label %.lr.ph86.us.us.new

.preheader68.loopexit:                            ; preds = %._crit_edge90.us
  br label %.preheader68

.preheader68:                                     ; preds = %.preheader68.loopexit, %.preheader69.lr.ph, %.preheader70
  %73 = icmp sgt i32 %0, 0
  br i1 %73, label %.preheader.lr.ph, label %._crit_edge77

.preheader.lr.ph:                                 ; preds = %.preheader71.lr.ph, %.preheader68
  %74 = icmp sgt i32 %3, 0
  %75 = icmp sgt i32 %1, 0
  br i1 %74, label %.preheader.us.preheader, label %._crit_edge77

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %76 = add i32 %3, -1
  %77 = zext i32 %76 to i64
  %78 = shl nuw nsw i64 %77, 3
  %79 = add nuw nsw i64 %78, 8
  %wide.trip.count126 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %80 = icmp eq i32 %1, 1
  %wide.trip.count121 = zext i32 %3 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge75.us, %.preheader.us.preheader
  %indvars.iv124 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next125, %._crit_edge75.us ]
  br i1 %75, label %.lr.ph.us.us.preheader, label %._crit_edge75.us.loopexit112

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %81 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv124, i64 0
  br label %.lr.ph.us.us

._crit_edge75.us.loopexit112:                     ; preds = %.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvars.iv124, i64 0
  %scevgep118 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep118, i8 0, i64 %79, i32 8, i1 false)
  br label %._crit_edge75.us

._crit_edge75.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge75.us

._crit_edge75.us:                                 ; preds = %._crit_edge75.us.loopexit, %._crit_edge75.us.loopexit112
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next125, %wide.trip.count126
  br i1 %exitcond127, label %._crit_edge77.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %82 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv124, i64 %indvars.iv119
  store double 0.000000e+00, double* %82, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %83 = load double, double* %81, align 8
  %84 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv119
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = load double, double* %82, align 8
  %88 = fadd double %87, %86
  store double %88, double* %82, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %80, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond = icmp eq i64 %indvars.iv.next120, %wide.trip.count121
  br i1 %exitcond, label %._crit_edge75.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %89 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv124, i64 %indvars.iv
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv119
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = load double, double* %82, align 8
  %95 = fadd double %94, %93
  store double %95, double* %82, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %96 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv124, i64 %indvars.iv.next
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv119
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = load double, double* %82, align 8
  %102 = fadd double %101, %100
  store double %102, double* %82, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge77.loopexit:                           ; preds = %._crit_edge75.us
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %.preheader.lr.ph, %.preheader68
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count17 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv15, %10
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
