; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge5

._crit_edge5:                                     ; preds = %6
  br label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %._crit_edge5, %._crit_edge, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
.preheader62.lr.ph:
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88..lr.ph84_crit_edge, %.preheader62.lr.ph
  %indvars.iv140 = phi i64 [ 0, %.preheader62.lr.ph ], [ %indvars.iv.next141, %._crit_edge88..lr.ph84_crit_edge ]
  %indvars.iv138 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next139, %._crit_edge88..lr.ph84_crit_edge ]
  %2 = add nuw nsw i64 %indvars.iv140, 1
  %3 = sub nsw i64 1998, %indvars.iv140
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  br label %9

.preheader61:                                     ; preds = %9
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %6 = icmp slt i64 %indvars.iv.next141, 2000
  br i1 %6, label %.lr.ph87.preheader, label %.preheader61.._crit_edge88_crit_edge

.preheader61.._crit_edge88_crit_edge:             ; preds = %.preheader61
  br label %._crit_edge88

.lr.ph87.preheader:                               ; preds = %.preheader61
  %7 = add nuw nsw i64 %5, 8
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %2
  %8 = mul nuw nsw i64 %indvars.iv140, 2000
  %scevgep136 = getelementptr double, double* %scevgep135, i64 %8
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep136137, i8 0, i64 %7, i32 8, i1 false)
  br label %._crit_edge88

; <label>:9:                                      ; preds = %._crit_edge, %.lr.ph84
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge ], [ 0, %.lr.ph84 ]
  %10 = sub nsw i64 0, %indvars.iv123
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv123
  store double %15, double* %16, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next124, %indvars.iv138
  br i1 %exitcond128, label %.preheader61, label %._crit_edge

._crit_edge:                                      ; preds = %9
  br label %9

._crit_edge88:                                    ; preds = %.preheader61.._crit_edge88_crit_edge, %.lr.ph87.preheader
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %17, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, 2000
  br i1 %exitcond143, label %._crit_edge90, label %._crit_edge88..lr.ph84_crit_edge

._crit_edge88..lr.ph84_crit_edge:                 ; preds = %._crit_edge88
  br label %.lr.ph84

._crit_edge90:                                    ; preds = %._crit_edge88
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge81.us.3

.preheader57.us.us.preheader:                     ; preds = %._crit_edge70.us..preheader57.us.us.preheader_crit_edge, %.preheader57.us.us.preheader.preheader
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge70.us..preheader57.us.us.preheader_crit_edge ], [ 0, %.preheader57.us.us.preheader.preheader ]
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond111, label %.preheader.us.preheader, label %._crit_edge70.us..preheader57.us.us.preheader_crit_edge

._crit_edge70.us..preheader57.us.us.preheader_crit_edge: ; preds = %._crit_edge70.us
  br label %.preheader57.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge70.us
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us..preheader57.us.us_crit_edge, %.preheader57.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge68.us.us..preheader57.us.us_crit_edge ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv108
  br label %.preheader57.us.us.new

._crit_edge68.us.us:                              ; preds = %.preheader57.us.us.new
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond107, label %._crit_edge70.us, label %._crit_edge68.us.us..preheader57.us.us_crit_edge

._crit_edge68.us.us..preheader57.us.us_crit_edge: ; preds = %._crit_edge68.us.us
  br label %.preheader57.us.us

.preheader57.us.us.new:                           ; preds = %.preheader57.us.us.new..preheader57.us.us.new_crit_edge, %.preheader57.us.us
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %.preheader57.us.us.new..preheader57.us.us.new_crit_edge ], [ 0, %.preheader57.us.us ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv108
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv104, i64 %indvars.iv96
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next97 = or i64 %indvars.iv96, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next97, i64 %indvars.iv108
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next97
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, 2000
  br i1 %exitcond99.1, label %._crit_edge68.us.us, label %.preheader57.us.us.new..preheader57.us.us.new_crit_edge

.preheader57.us.us.new..preheader57.us.us.new_crit_edge: ; preds = %.preheader57.us.us.new
  br label %.preheader57.us.us.new

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new..preheader.us.new_crit_edge ], [ 0, %.preheader.us ]
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond, label %._crit_edge65, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge65:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %18) #3
  ret void

._crit_edge81.us.3:                               ; preds = %._crit_edge81.us.3.._crit_edge81.us.3_crit_edge, %._crit_edge90
  %indvars.iv116 = phi i64 [ 0, %._crit_edge90 ], [ %indvars.iv.next117.3.1, %._crit_edge81.us.3.._crit_edge81.us.3_crit_edge ]
  %55 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %56 = mul nuw nsw i64 %indvars.iv116, 16000
  %57 = add nuw nsw i64 %56, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %58 = mul nuw nsw i64 %indvars.iv116, 16000
  %59 = add nuw nsw i64 %58, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %60 = mul nuw nsw i64 %indvars.iv116, 16000
  %61 = add nuw nsw i64 %60, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %62 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.1162 = getelementptr i8, i8* %18, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1162, i8 0, i64 16000, i32 8, i1 false)
  %63 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %64 = add nuw nsw i64 %63, 16000
  %scevgep.1.1 = getelementptr i8, i8* %18, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %65 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %66 = add nuw nsw i64 %65, 32000
  %scevgep.2.1 = getelementptr i8, i8* %18, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %67 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %68 = add nuw nsw i64 %67, 48000
  %scevgep.3.1 = getelementptr i8, i8* %18, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, 2000
  br i1 %exitcond119.3.1, label %.preheader57.us.us.preheader.preheader, label %._crit_edge81.us.3.._crit_edge81.us.3_crit_edge

._crit_edge81.us.3.._crit_edge81.us.3_crit_edge:  ; preds = %._crit_edge81.us.3
  br label %._crit_edge81.us.3

.preheader57.us.us.preheader.preheader:           ; preds = %._crit_edge81.us.3
  %69 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader57.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #0 {
.preheader35.preheader:
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge42..preheader35_crit_edge, %.preheader35.preheader
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge42..preheader35_crit_edge ], [ 0, %.preheader35.preheader ]
  %2 = add nuw nsw i64 %indvars.iv80, 4294967295
  %3 = icmp sgt i64 %indvars.iv80, 0
  br i1 %3, label %.preheader33.preheader, label %.preheader35.._crit_edge42_crit_edge

.preheader35.._crit_edge42_crit_edge:             ; preds = %.preheader35
  br label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  br label %.preheader33

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %5 = icmp sgt i64 %indvars.iv80, 0
  br i1 %5, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge42_crit_edge

.preheader.lr.ph.._crit_edge42_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge42

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter6984 = and i64 %indvars.iv80, 1
  %6 = trunc i64 %2 to i32
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  %8 = icmp eq i64 %xtraiter6984, 0
  %9 = icmp eq i32 %6, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge40.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge40.us..preheader.us_crit_edge ], [ %indvars.iv80, %.preheader.us.preheader ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv74
  %.pre50 = load double, double* %10, align 8
  br i1 %8, label %.preheader.us..prol.loopexit68_crit_edge, label %11

.preheader.us..prol.loopexit68_crit_edge:         ; preds = %.preheader.us
  br label %.prol.loopexit68

; <label>:11:                                     ; preds = %.preheader.us
  %12 = load double, double* %7, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv74
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %.pre50, %15
  store double %16, double* %10, align 8
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.preheader.us..prol.loopexit68_crit_edge, %11
  %indvars.iv62.unr.ph = phi i64 [ 1, %11 ], [ 0, %.preheader.us..prol.loopexit68_crit_edge ]
  %.unr71.ph = phi double [ %16, %11 ], [ %.pre50, %.preheader.us..prol.loopexit68_crit_edge ]
  br i1 %9, label %.prol.loopexit68.._crit_edge40.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit68.._crit_edge40.us_crit_edge:      ; preds = %.prol.loopexit68
  br label %._crit_edge40.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit68
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv62.unr.ph, %.preheader.us.new.preheader ]
  %17 = phi double [ %29, %.preheader.us.new..preheader.us.new_crit_edge ], [ %.unr71.ph, %.preheader.us.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv62
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv74
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %10, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next63
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next63, i64 %indvars.iv74
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %10, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond66.1 = icmp eq i64 %indvars.iv.next63.1, %indvars.iv80
  br i1 %exitcond66.1, label %._crit_edge40.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge40.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %.prol.loopexit68.._crit_edge40.us_crit_edge, %._crit_edge40.us.loopexit
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond77, label %._crit_edge42.loopexit, label %._crit_edge40.us..preheader.us_crit_edge

._crit_edge40.us..preheader.us_crit_edge:         ; preds = %._crit_edge40.us
  br label %.preheader.us

.preheader33:                                     ; preds = %._crit_edge..preheader33_crit_edge, %.preheader33.preheader
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge..preheader33_crit_edge ], [ 0, %.preheader33.preheader ]
  %30 = add nuw nsw i64 %indvars.iv56, 4294967295
  %31 = icmp sgt i64 %indvars.iv56, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv56
  %.pre = load double, double* %32, align 8
  br i1 %31, label %.lr.ph, label %.preheader33.._crit_edge_crit_edge

.preheader33.._crit_edge_crit_edge:               ; preds = %.preheader33
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter85 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %33

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

; <label>:33:                                     ; preds = %.lr.ph
  %34 = load double, double* %4, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv56
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %.pre, %37
  store double %38, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %33
  %indvars.iv.unr.ph = phi i64 [ 1, %33 ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %38, %33 ], [ %.pre, %.lr.ph..prol.loopexit_crit_edge ]
  %.lcssa.unr.ph = phi double [ %38, %33 ], [ undef, %.lr.ph..prol.loopexit_crit_edge ]
  %39 = trunc i64 %30 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %41 = phi double [ %53, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv56
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv56
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  store double %53, double* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv56
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.preheader33.._crit_edge_crit_edge, %._crit_edge.loopexit
  %54 = phi double [ %.lcssa.unr.ph, %.prol.loopexit.._crit_edge_crit_edge ], [ %.pre, %.preheader33.._crit_edge_crit_edge ], [ %53, %._crit_edge.loopexit ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv56
  %56 = load double, double* %55, align 8
  %57 = fdiv double %54, %56
  store double %57, double* %32, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv80
  br i1 %exitcond, label %.preheader.lr.ph, label %._crit_edge..preheader33_crit_edge

._crit_edge..preheader33_crit_edge:               ; preds = %._crit_edge
  br label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %.preheader.lr.ph.._crit_edge42_crit_edge, %.preheader35.._crit_edge42_crit_edge, %._crit_edge42.loopexit
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond83, label %._crit_edge46, label %._crit_edge42..preheader35_crit_edge

._crit_edge42..preheader35_crit_edge:             ; preds = %._crit_edge42
  br label %.preheader35

._crit_edge46:                                    ; preds = %._crit_edge42
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us..preheader.us_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv12, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge16, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge16 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge16

._crit_edge16:                                    ; preds = %14
  br label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond15, label %._crit_edge11, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
