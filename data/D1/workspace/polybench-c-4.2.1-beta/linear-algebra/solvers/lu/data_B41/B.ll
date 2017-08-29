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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge7

._crit_edge7:                                     ; preds = %6
  br label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %._crit_edge7, %._crit_edge, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader62.lr.ph, label %._crit_edge90.thread

._crit_edge90.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge65

.preheader62.lr.ph:                               ; preds = %2
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88..lr.ph84_crit_edge, %.preheader62.lr.ph
  %indvars.iv140 = phi i64 [ 0, %.preheader62.lr.ph ], [ %6, %._crit_edge88..lr.ph84_crit_edge ]
  %indvars.iv138 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next139, %._crit_edge88..lr.ph84_crit_edge ]
  %4 = sub i64 1998, %indvars.iv140
  %5 = shl i64 %4, 3
  br label %11

.preheader61:                                     ; preds = %11
  %6 = add nuw nsw i64 %indvars.iv140, 1
  %7 = icmp slt i64 %6, 2000
  br i1 %7, label %.lr.ph87.preheader, label %.preheader61.._crit_edge88_crit_edge

.preheader61.._crit_edge88_crit_edge:             ; preds = %.preheader61
  br label %._crit_edge88

.lr.ph87.preheader:                               ; preds = %.preheader61
  %8 = and i64 %5, 34359738360
  %9 = add nuw nsw i64 %8, 8
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %6
  %10 = mul nuw nsw i64 %indvars.iv140, 2000
  %scevgep136 = getelementptr double, double* %scevgep135, i64 %10
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep136137, i8 0, i64 %9, i32 8, i1 false)
  br label %._crit_edge88

; <label>:11:                                     ; preds = %._crit_edge, %.lr.ph84
  %indvars.iv123 = phi i64 [ 0, %.lr.ph84 ], [ %indvars.iv.next124, %._crit_edge ]
  %12 = sub nsw i64 0, %indvars.iv123
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 2000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.000000e+03
  %17 = fadd double %16, 1.000000e+00
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv123
  store double %17, double* %18, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next124, %indvars.iv138
  br i1 %exitcond128, label %.preheader61, label %._crit_edge

._crit_edge:                                      ; preds = %11
  br label %11

._crit_edge88:                                    ; preds = %.preheader61.._crit_edge88_crit_edge, %.lr.ph87.preheader
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %19, align 8
  %exitcond143 = icmp eq i64 %6, 2000
  br i1 %exitcond143, label %.preheader60.us.preheader, label %._crit_edge88..lr.ph84_crit_edge

._crit_edge88..lr.ph84_crit_edge:                 ; preds = %._crit_edge88
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  br label %.lr.ph84

.preheader60.us.preheader:                        ; preds = %._crit_edge88
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 true, label %.preheader60.us.preheader..preheader60.us.prol.loopexit_crit_edge, label %._crit_edge81.us.prol.preheader

.preheader60.us.preheader..preheader60.us.prol.loopexit_crit_edge: ; preds = %.preheader60.us.preheader
  br label %.preheader60.us.prol.loopexit

._crit_edge81.us.prol.preheader:                  ; preds = %.preheader60.us.preheader
  br label %._crit_edge81.us.prol

._crit_edge81.us.prol:                            ; preds = %._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge, %._crit_edge81.us.prol.preheader
  %indvars.iv116.prol = phi i64 [ %indvars.iv.next117.prol, %._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge ], [ 0, %._crit_edge81.us.prol.preheader ]
  %prol.iter122 = phi i32 [ %prol.iter122.sub, %._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge ], [ 0, %._crit_edge81.us.prol.preheader ]
  %21 = mul nuw nsw i64 %indvars.iv116.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %20, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %prol.iter122.sub = add nsw i32 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i32 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %.preheader60.us.prol.loopexit.loopexit, label %._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge, !llvm.loop !1

._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge: ; preds = %._crit_edge81.us.prol
  %indvars.iv.next117.prol = add nuw nsw i64 %indvars.iv116.prol, 1
  br label %._crit_edge81.us.prol

.preheader60.us.prol.loopexit.loopexit:           ; preds = %._crit_edge81.us.prol
  br label %.preheader60.us.prol.loopexit

.preheader60.us.prol.loopexit:                    ; preds = %.preheader60.us.preheader..preheader60.us.prol.loopexit_crit_edge, %.preheader60.us.prol.loopexit.loopexit
  %indvars.iv116.unr = phi i64 [ 4294967296, %.preheader60.us.prol.loopexit.loopexit ], [ 0, %.preheader60.us.preheader..preheader60.us.prol.loopexit_crit_edge ]
  br i1 false, label %.preheader60.us.prol.loopexit..preheader58.lr.ph_crit_edge, label %._crit_edge81.us.3.preheader

.preheader60.us.prol.loopexit..preheader58.lr.ph_crit_edge: ; preds = %.preheader60.us.prol.loopexit
  br label %.preheader58.lr.ph

._crit_edge81.us.3.preheader:                     ; preds = %.preheader60.us.prol.loopexit
  %22 = sub nsw i64 1996, %indvars.iv116.unr
  %23 = lshr i64 %22, 2
  %24 = and i64 %23, 1
  %lcmp.mod = icmp eq i64 %24, 0
  br i1 %lcmp.mod, label %._crit_edge81.us.3.prol.preheader, label %._crit_edge81.us.3.preheader.._crit_edge81.us.3.prol.loopexit_crit_edge

._crit_edge81.us.3.preheader.._crit_edge81.us.3.prol.loopexit_crit_edge: ; preds = %._crit_edge81.us.3.preheader
  br label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.preheader:                ; preds = %._crit_edge81.us.3.preheader
  br label %._crit_edge81.us.3.prol

._crit_edge81.us.3.prol:                          ; preds = %._crit_edge81.us.3.prol.preheader
  %25 = mul nsw i64 %indvars.iv116.unr, 16000
  %scevgep.prol150 = getelementptr i8, i8* %20, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol150, i8 0, i64 16000, i32 8, i1 false)
  %26 = add i64 %25, 16000
  %scevgep.1.prol = getelementptr i8, i8* %20, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 16000, i32 8, i1 false)
  %27 = add i64 %25, 32000
  %scevgep.2.prol = getelementptr i8, i8* %20, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 16000, i32 8, i1 false)
  %28 = add i64 %25, 48000
  %scevgep.3.prol = getelementptr i8, i8* %20, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3.prol = add nsw i64 %indvars.iv116.unr, 4
  br label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.loopexit:                 ; preds = %._crit_edge81.us.3.preheader.._crit_edge81.us.3.prol.loopexit_crit_edge, %._crit_edge81.us.3.prol
  %indvars.iv116.unr151 = phi i64 [ %indvars.iv116.unr, %._crit_edge81.us.3.preheader.._crit_edge81.us.3.prol.loopexit_crit_edge ], [ %indvars.iv.next117.3.prol, %._crit_edge81.us.3.prol ]
  %29 = icmp eq i64 %23, 0
  br i1 %29, label %._crit_edge81.us.3.prol.loopexit..preheader58.lr.ph.loopexit_crit_edge, label %._crit_edge81.us.3.preheader.new

._crit_edge81.us.3.prol.loopexit..preheader58.lr.ph.loopexit_crit_edge: ; preds = %._crit_edge81.us.3.prol.loopexit
  br label %.preheader58.lr.ph.loopexit

._crit_edge81.us.3.preheader.new:                 ; preds = %._crit_edge81.us.3.prol.loopexit
  br label %._crit_edge81.us.3

.preheader58.lr.ph.loopexit.unr-lcssa:            ; preds = %._crit_edge81.us.3
  br label %.preheader58.lr.ph.loopexit

.preheader58.lr.ph.loopexit:                      ; preds = %._crit_edge81.us.3.prol.loopexit..preheader58.lr.ph.loopexit_crit_edge, %.preheader58.lr.ph.loopexit.unr-lcssa
  br label %.preheader58.lr.ph

.preheader58.lr.ph:                               ; preds = %.preheader60.us.prol.loopexit..preheader58.lr.ph_crit_edge, %.preheader58.lr.ph.loopexit
  %30 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %31 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %._crit_edge70.us..preheader57.us.us.preheader_crit_edge, %.preheader58.lr.ph
  %indvars.iv108 = phi i64 [ 0, %.preheader58.lr.ph ], [ %indvars.iv.next109, %._crit_edge70.us..preheader57.us.us.preheader_crit_edge ]
  %sunkaddr146 = shl i64 %indvars.iv108, 3
  %sunkaddr147 = add i64 %sunkaddr, %sunkaddr146
  %sunkaddr148 = inttoptr i64 %sunkaddr147 to double*
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond111, label %.preheader.us.preheader, label %._crit_edge70.us..preheader57.us.us.preheader_crit_edge

._crit_edge70.us..preheader57.us.us.preheader_crit_edge: ; preds = %._crit_edge70.us
  br label %.preheader57.us.us.preheader

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us..preheader57.us.us_crit_edge, %.preheader57.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge68.us.us..preheader57.us.us_crit_edge ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv108
  br i1 true, label %.preheader57.us.us..prol.loopexit101_crit_edge, label %33

.preheader57.us.us..prol.loopexit101_crit_edge:   ; preds = %.preheader57.us.us
  br label %.prol.loopexit101

; <label>:33:                                     ; preds = %.preheader57.us.us
  %34 = load double, double* %32, align 8
  %35 = load double, double* %sunkaddr148, align 8
  %36 = fmul double %34, %35
  %37 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv104, i64 0
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %36
  store double %39, double* %37, align 8
  br label %.prol.loopexit101

.prol.loopexit101:                                ; preds = %.preheader57.us.us..prol.loopexit101_crit_edge, %33
  %indvars.iv96.unr.ph = phi i64 [ 1, %33 ], [ 0, %.preheader57.us.us..prol.loopexit101_crit_edge ]
  br i1 false, label %.prol.loopexit101.._crit_edge68.us.us_crit_edge, label %.preheader57.us.us.new.preheader

.prol.loopexit101.._crit_edge68.us.us_crit_edge:  ; preds = %.prol.loopexit101
  br label %._crit_edge68.us.us

.preheader57.us.us.new.preheader:                 ; preds = %.prol.loopexit101
  br label %.preheader57.us.us.new

._crit_edge68.us.us.loopexit:                     ; preds = %.preheader57.us.us.new
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %.prol.loopexit101.._crit_edge68.us.us_crit_edge, %._crit_edge68.us.us.loopexit
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond107, label %._crit_edge70.us, label %._crit_edge68.us.us..preheader57.us.us_crit_edge

._crit_edge68.us.us..preheader57.us.us_crit_edge: ; preds = %._crit_edge68.us.us
  br label %.preheader57.us.us

.preheader57.us.us.new:                           ; preds = %.preheader57.us.us.new..preheader57.us.us.new_crit_edge, %.preheader57.us.us.new.preheader
  %indvars.iv96 = phi i64 [ %indvars.iv96.unr.ph, %.preheader57.us.us.new.preheader ], [ %indvars.iv.next97.1, %.preheader57.us.us.new..preheader57.us.us.new_crit_edge ]
  %40 = load double, double* %32, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv108
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv104, i64 %indvars.iv96
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %47 = load double, double* %32, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next97, i64 %indvars.iv108
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next97
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, 2000
  br i1 %exitcond99.1, label %._crit_edge68.us.us.loopexit, label %.preheader57.us.us.new..preheader57.us.us.new_crit_edge

.preheader57.us.us.new..preheader57.us.us.new_crit_edge: ; preds = %.preheader57.us.us.new
  br label %.preheader57.us.us.new

.preheader.us.preheader:                          ; preds = %._crit_edge70.us
  %54 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %55 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv93 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next94, %._crit_edge.us..preheader.us_crit_edge ]
  br i1 true, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv93, i64 %indvars.iv.prol
  %57 = bitcast double* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.prol
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us..prol.loopexit_crit_edge ], [ 4294967296, %.prol.loopexit.loopexit ]
  br i1 false, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.preheader.us.new.preheader ], [ %indvars.iv.next.3, %.preheader.us.new..preheader.us.new_crit_edge ]
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %67 = bitcast double* %66 to i64*
  %68 = load i64, i64* %67, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next
  %70 = bitcast double* %69 to i64*
  store i64 %68, i64* %70, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond, label %._crit_edge65.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge65.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %._crit_edge90.thread
  %81 = phi i8* [ %3, %._crit_edge90.thread ], [ %20, %._crit_edge65.loopexit ]
  tail call void @free(i8* %81) #4
  ret void

._crit_edge81.us.3:                               ; preds = %._crit_edge81.us.3.._crit_edge81.us.3_crit_edge, %._crit_edge81.us.3.preheader.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr151, %._crit_edge81.us.3.preheader.new ], [ %indvars.iv.next117.3.1, %._crit_edge81.us.3.._crit_edge81.us.3_crit_edge ]
  %82 = mul i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %20, i64 %82
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %83 = add i64 %82, 16000
  %scevgep.1 = getelementptr i8, i8* %20, i64 %83
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %84 = add i64 %82, 32000
  %scevgep.2 = getelementptr i8, i8* %20, i64 %84
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %85 = add i64 %82, 48000
  %scevgep.3 = getelementptr i8, i8* %20, i64 %85
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %86 = mul i64 %indvars.iv116, 16000
  %87 = add i64 %86, 64000
  %scevgep.1152 = getelementptr i8, i8* %20, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1152, i8 0, i64 16000, i32 8, i1 false)
  %88 = add i64 %86, 80000
  %scevgep.1.1 = getelementptr i8, i8* %20, i64 %88
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %89 = add i64 %86, 96000
  %scevgep.2.1 = getelementptr i8, i8* %20, i64 %89
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %90 = add i64 %86, 112000
  %scevgep.3.1 = getelementptr i8, i8* %20, i64 %90
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, 2000
  br i1 %exitcond119.3.1, label %.preheader58.lr.ph.loopexit.unr-lcssa, label %._crit_edge81.us.3.._crit_edge81.us.3_crit_edge

._crit_edge81.us.3.._crit_edge81.us.3_crit_edge:  ; preds = %._crit_edge81.us.3
  br label %._crit_edge81.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader35.preheader, label %.._crit_edge46_crit_edge

.._crit_edge46_crit_edge:                         ; preds = %2
  br label %._crit_edge46

.preheader35.preheader:                           ; preds = %2
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge42..preheader35_crit_edge, %.preheader35.preheader
  %indvars.iv80 = phi i64 [ 0, %.preheader35.preheader ], [ %indvars.iv.next81, %._crit_edge42..preheader35_crit_edge ]
  %3 = add nuw i64 %indvars.iv80, 4294967295
  %4 = icmp sgt i64 %indvars.iv80, 0
  br i1 %4, label %.preheader33.preheader, label %.preheader35.._crit_edge42_crit_edge

.preheader35.._crit_edge42_crit_edge:             ; preds = %.preheader35
  br label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  br label %.preheader33

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter6984 = and i64 %indvars.iv80, 1
  %6 = trunc i64 %3 to i32
  %7 = icmp eq i64 %xtraiter6984, 0
  %8 = icmp eq i32 %6, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge40.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv80, %.preheader.us.preheader ], [ %indvars.iv.next75, %._crit_edge40.us..preheader.us_crit_edge ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv74
  %.pre50 = load double, double* %9, align 8
  br i1 %7, label %.preheader.us..prol.loopexit68_crit_edge, label %10

.preheader.us..prol.loopexit68_crit_edge:         ; preds = %.preheader.us
  br label %.prol.loopexit68

; <label>:10:                                     ; preds = %.preheader.us
  %11 = load double, double* %5, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv74
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre50, %14
  store double %15, double* %9, align 8
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.preheader.us..prol.loopexit68_crit_edge, %10
  %indvars.iv62.unr.ph = phi i64 [ 1, %10 ], [ 0, %.preheader.us..prol.loopexit68_crit_edge ]
  %.unr71.ph = phi double [ %15, %10 ], [ %.pre50, %.preheader.us..prol.loopexit68_crit_edge ]
  br i1 %8, label %.prol.loopexit68.._crit_edge40.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit68.._crit_edge40.us_crit_edge:      ; preds = %.prol.loopexit68
  br label %._crit_edge40.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit68
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %.preheader.us.new.preheader ], [ %indvars.iv.next63.1, %.preheader.us.new..preheader.us.new_crit_edge ]
  %16 = phi double [ %.unr71.ph, %.preheader.us.new.preheader ], [ %28, %.preheader.us.new..preheader.us.new_crit_edge ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv62
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv74
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %9, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next63
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next63, i64 %indvars.iv74
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %9, align 8
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
  %indvars.iv56 = phi i64 [ 0, %.preheader33.preheader ], [ %indvars.iv.next57, %._crit_edge..preheader33_crit_edge ]
  %29 = add nuw i64 %indvars.iv56, 4294967295
  %30 = icmp sgt i64 %indvars.iv56, 0
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv56
  %.pre = load double, double* %31, align 8
  br i1 %30, label %.lr.ph, label %.preheader33.._crit_edge_crit_edge

.preheader33.._crit_edge_crit_edge:               ; preds = %.preheader33
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter85 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %32

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

; <label>:32:                                     ; preds = %.lr.ph
  %33 = load double, double* %5, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv56
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fsub double %.pre, %36
  store double %37, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %32
  %indvars.iv.unr.ph = phi i64 [ 1, %32 ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %37, %32 ], [ %.pre, %.lr.ph..prol.loopexit_crit_edge ]
  %.lcssa.unr.ph = phi double [ %37, %32 ], [ undef, %.lr.ph..prol.loopexit_crit_edge ]
  %38 = trunc i64 %29 to i32
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ]
  %40 = phi double [ %.unr.ph, %.lr.ph.new.preheader ], [ %52, %.lr.ph.new..lr.ph.new_crit_edge ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv56
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %40, %45
  store double %46, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv56
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  store double %52, double* %31, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv56
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.preheader33.._crit_edge_crit_edge, %._crit_edge.loopexit
  %53 = phi double [ %.pre, %.preheader33.._crit_edge_crit_edge ], [ %.lcssa.unr.ph, %.prol.loopexit.._crit_edge_crit_edge ], [ %52, %._crit_edge.loopexit ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv56
  %55 = load double, double* %54, align 8
  %56 = fdiv double %53, %55
  store double %56, double* %31, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv80
  br i1 %exitcond, label %.preheader.us.preheader, label %._crit_edge..preheader33_crit_edge

._crit_edge..preheader33_crit_edge:               ; preds = %._crit_edge
  br label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %.preheader35.._crit_edge42_crit_edge, %._crit_edge42.loopexit
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond83, label %._crit_edge46.loopexit, label %._crit_edge42..preheader35_crit_edge

._crit_edge42..preheader35_crit_edge:             ; preds = %._crit_edge42
  br label %.preheader35

._crit_edge46.loopexit:                           ; preds = %._crit_edge42
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %.._crit_edge46_crit_edge, %._crit_edge46.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.us.preheader, label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %2
  br label %._crit_edge11

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us..preheader.us_crit_edge ]
  %7 = mul nsw i64 %indvars.iv12, 2000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge18, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge18 ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %._crit_edge, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge18

._crit_edge18:                                    ; preds = %15
  br label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond15, label %._crit_edge11.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %._crit_edge11.loopexit
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
