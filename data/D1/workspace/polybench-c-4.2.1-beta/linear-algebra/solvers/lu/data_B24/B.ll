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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge6

.._crit_edge_crit_edge6:                          ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge6, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader62.lr.ph, label %._crit_edge90.thread

._crit_edge90.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge65

.preheader62.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count142 = zext i32 %0 to i64
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88..lr.ph84_crit_edge, %.preheader62.lr.ph
  %indvars.iv140 = phi i64 [ 0, %.preheader62.lr.ph ], [ %indvars.iv.next141, %._crit_edge88..lr.ph84_crit_edge ]
  %indvars.iv138 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next139, %._crit_edge88..lr.ph84_crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv140, 1
  %10 = sub i64 %7, %indvars.iv140
  %11 = shl i64 %10, 3
  %12 = and i64 %11, 34359738360
  br label %._crit_edge

.preheader61:                                     ; preds = %._crit_edge
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %13 = icmp slt i64 %indvars.iv.next141, %8
  br i1 %13, label %.lr.ph87.preheader, label %.preheader61.._crit_edge88_crit_edge

.preheader61.._crit_edge88_crit_edge:             ; preds = %.preheader61
  br label %._crit_edge88

.lr.ph87.preheader:                               ; preds = %.preheader61
  %14 = add nuw nsw i64 %12, 8
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %9
  %15 = mul nuw nsw i64 %indvars.iv140, 2000
  %scevgep136 = getelementptr double, double* %scevgep135, i64 %15
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep136137, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge88

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph84
  %indvars.iv123 = phi i64 [ 0, %.lr.ph84 ], [ %indvars.iv.next124, %._crit_edge.._crit_edge_crit_edge ]
  %16 = sub nsw i64 0, %indvars.iv123
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv123
  store double %21, double* %22, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next124, %indvars.iv138
  br i1 %exitcond128, label %.preheader61, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge88:                                    ; preds = %.preheader61.._crit_edge88_crit_edge, %.lr.ph87.preheader
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %23, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond143, label %._crit_edge90, label %._crit_edge88..lr.ph84_crit_edge

._crit_edge88..lr.ph84_crit_edge:                 ; preds = %._crit_edge88
  br label %.lr.ph84

._crit_edge90:                                    ; preds = %._crit_edge88
  %24 = icmp sgt i32 %0, 0
  %25 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 %24, label %.preheader60.us.preheader, label %._crit_edge90.._crit_edge65_crit_edge

._crit_edge90.._crit_edge65_crit_edge:            ; preds = %._crit_edge90
  br label %._crit_edge65

.preheader60.us.preheader:                        ; preds = %._crit_edge90
  %26 = add i32 %0, -1
  %27 = zext i32 %26 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = add nuw nsw i64 %28, 8
  %xtraiter120 = and i32 %0, 3
  %lcmp.mod121 = icmp eq i32 %xtraiter120, 0
  br i1 %lcmp.mod121, label %.preheader60.us.preheader..preheader60.us.prol.loopexit_crit_edge, label %._crit_edge81.us.prol.preheader

.preheader60.us.preheader..preheader60.us.prol.loopexit_crit_edge: ; preds = %.preheader60.us.preheader
  br label %.preheader60.us.prol.loopexit

._crit_edge81.us.prol.preheader:                  ; preds = %.preheader60.us.preheader
  %30 = add nsw i32 %xtraiter120, -1
  %31 = zext i32 %30 to i64
  br label %._crit_edge81.us.prol

._crit_edge81.us.prol:                            ; preds = %._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge, %._crit_edge81.us.prol.preheader
  %indvars.iv116.prol = phi i64 [ %indvars.iv.next117.prol, %._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge ], [ 0, %._crit_edge81.us.prol.preheader ]
  %prol.iter122 = phi i32 [ %prol.iter122.sub, %._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge ], [ %xtraiter120, %._crit_edge81.us.prol.preheader ]
  %32 = mul nuw nsw i64 %indvars.iv116.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %25, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next117.prol = add nuw nsw i64 %indvars.iv116.prol, 1
  %prol.iter122.sub = add nsw i32 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i32 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %.preheader60.us.prol.loopexit.loopexit, label %._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge, !llvm.loop !1

._crit_edge81.us.prol.._crit_edge81.us.prol_crit_edge: ; preds = %._crit_edge81.us.prol
  br label %._crit_edge81.us.prol

.preheader60.us.prol.loopexit.loopexit:           ; preds = %._crit_edge81.us.prol
  %33 = add nuw nsw i64 %31, 1
  br label %.preheader60.us.prol.loopexit

.preheader60.us.prol.loopexit:                    ; preds = %.preheader60.us.preheader..preheader60.us.prol.loopexit_crit_edge, %.preheader60.us.prol.loopexit.loopexit
  %indvars.iv116.unr = phi i64 [ 0, %.preheader60.us.preheader..preheader60.us.prol.loopexit_crit_edge ], [ %33, %.preheader60.us.prol.loopexit.loopexit ]
  %34 = icmp ult i32 %26, 3
  br i1 %34, label %.preheader60.us.prol.loopexit..preheader58.lr.ph_crit_edge, label %._crit_edge81.us.3.preheader

.preheader60.us.prol.loopexit..preheader58.lr.ph_crit_edge: ; preds = %.preheader60.us.prol.loopexit
  br label %.preheader58.lr.ph

._crit_edge81.us.3.preheader:                     ; preds = %.preheader60.us.prol.loopexit
  %wide.trip.count118.3 = zext i32 %0 to i64
  %35 = add nsw i64 %wide.trip.count118.3, -4
  %36 = sub nsw i64 %35, %indvars.iv116.unr
  %37 = lshr i64 %36, 2
  %38 = and i64 %37, 1
  %lcmp.mod = icmp eq i64 %38, 0
  br i1 %lcmp.mod, label %._crit_edge81.us.3.prol.preheader, label %._crit_edge81.us.3.preheader.._crit_edge81.us.3.prol.loopexit_crit_edge

._crit_edge81.us.3.preheader.._crit_edge81.us.3.prol.loopexit_crit_edge: ; preds = %._crit_edge81.us.3.preheader
  br label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.preheader:                ; preds = %._crit_edge81.us.3.preheader
  br label %._crit_edge81.us.3.prol

._crit_edge81.us.3.prol:                          ; preds = %._crit_edge81.us.3.prol.preheader
  %39 = mul nuw nsw i64 %indvars.iv116.unr, 16000
  %scevgep.prol151 = getelementptr i8, i8* %25, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol151, i8 0, i64 %29, i32 8, i1 false)
  %40 = mul nsw i64 %indvars.iv116.unr, 16000
  %41 = add i64 %40, 16000
  %scevgep.1.prol = getelementptr i8, i8* %25, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %29, i32 8, i1 false)
  %42 = mul nsw i64 %indvars.iv116.unr, 16000
  %43 = add i64 %42, 32000
  %scevgep.2.prol = getelementptr i8, i8* %25, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %29, i32 8, i1 false)
  %44 = mul nsw i64 %indvars.iv116.unr, 16000
  %45 = add i64 %44, 48000
  %scevgep.3.prol = getelementptr i8, i8* %25, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next117.3.prol = add nsw i64 %indvars.iv116.unr, 4
  br label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.loopexit:                 ; preds = %._crit_edge81.us.3.preheader.._crit_edge81.us.3.prol.loopexit_crit_edge, %._crit_edge81.us.3.prol
  %indvars.iv116.unr152 = phi i64 [ %indvars.iv116.unr, %._crit_edge81.us.3.preheader.._crit_edge81.us.3.prol.loopexit_crit_edge ], [ %indvars.iv.next117.3.prol, %._crit_edge81.us.3.prol ]
  %46 = icmp eq i64 %37, 0
  br i1 %46, label %._crit_edge81.us.3.prol.loopexit..preheader59_crit_edge, label %._crit_edge81.us.3.preheader.new

._crit_edge81.us.3.prol.loopexit..preheader59_crit_edge: ; preds = %._crit_edge81.us.3.prol.loopexit
  br label %.preheader59

._crit_edge81.us.3.preheader.new:                 ; preds = %._crit_edge81.us.3.prol.loopexit
  br label %._crit_edge81.us.3

.preheader59.unr-lcssa:                           ; preds = %._crit_edge81.us.3
  br label %.preheader59

.preheader59:                                     ; preds = %._crit_edge81.us.3.prol.loopexit..preheader59_crit_edge, %.preheader59.unr-lcssa
  %47 = icmp sgt i32 %0, 0
  br i1 %47, label %.preheader59..preheader58.lr.ph_crit_edge, label %.preheader59.._crit_edge65_crit_edge

.preheader59.._crit_edge65_crit_edge:             ; preds = %.preheader59
  br label %._crit_edge65

.preheader59..preheader58.lr.ph_crit_edge:        ; preds = %.preheader59
  br label %.preheader58.lr.ph

.preheader58.lr.ph:                               ; preds = %.preheader59..preheader58.lr.ph_crit_edge, %.preheader60.us.prol.loopexit..preheader58.lr.ph_crit_edge
  %xtraiter102 = and i32 %0, 1
  %wide.trip.count106 = zext i32 %0 to i64
  %wide.trip.count98.1 = zext i32 %0 to i64
  %wide.trip.count110 = zext i32 %0 to i64
  %48 = icmp eq i32 %xtraiter102, 0
  %49 = icmp eq i32 %0, 1
  %50 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %25 to [2000 x [2000 x double]]*
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
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count110
  br i1 %exitcond111, label %.preheader56, label %._crit_edge70.us..preheader57.us.us.preheader_crit_edge

._crit_edge70.us..preheader57.us.us.preheader_crit_edge: ; preds = %._crit_edge70.us
  br label %.preheader57.us.us.preheader

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us..preheader57.us.us_crit_edge, %.preheader57.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge68.us.us..preheader57.us.us_crit_edge ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv108
  br i1 %48, label %.preheader57.us.us..prol.loopexit101_crit_edge, label %53

.preheader57.us.us..prol.loopexit101_crit_edge:   ; preds = %.preheader57.us.us
  br label %.prol.loopexit101

; <label>:53:                                     ; preds = %.preheader57.us.us
  %54 = load double, double* %52, align 8
  %55 = load double, double* %sunkaddr148, align 8
  %56 = fmul double %54, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv104, i64 0
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  br label %.prol.loopexit101

.prol.loopexit101:                                ; preds = %.preheader57.us.us..prol.loopexit101_crit_edge, %53
  %indvars.iv96.unr.ph = phi i64 [ 1, %53 ], [ 0, %.preheader57.us.us..prol.loopexit101_crit_edge ]
  br i1 %49, label %.prol.loopexit101.._crit_edge68.us.us_crit_edge, label %.preheader57.us.us.new.preheader

.prol.loopexit101.._crit_edge68.us.us_crit_edge:  ; preds = %.prol.loopexit101
  br label %._crit_edge68.us.us

.preheader57.us.us.new.preheader:                 ; preds = %.prol.loopexit101
  br label %.preheader57.us.us.new

._crit_edge68.us.us.loopexit:                     ; preds = %.preheader57.us.us.new
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %.prol.loopexit101.._crit_edge68.us.us_crit_edge, %._crit_edge68.us.us.loopexit
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, %wide.trip.count106
  br i1 %exitcond107, label %._crit_edge70.us, label %._crit_edge68.us.us..preheader57.us.us_crit_edge

._crit_edge68.us.us..preheader57.us.us_crit_edge: ; preds = %._crit_edge68.us.us
  br label %.preheader57.us.us

.preheader57.us.us.new:                           ; preds = %.preheader57.us.us.new..preheader57.us.us.new_crit_edge, %.preheader57.us.us.new.preheader
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %.preheader57.us.us.new..preheader57.us.us.new_crit_edge ], [ %indvars.iv96.unr.ph, %.preheader57.us.us.new.preheader ]
  %60 = load double, double* %52, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv108
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv104, i64 %indvars.iv96
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %64, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %67 = load double, double* %52, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next97, i64 %indvars.iv108
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next97
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %71, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, %wide.trip.count98.1
  br i1 %exitcond99.1, label %._crit_edge68.us.us.loopexit, label %.preheader57.us.us.new..preheader57.us.us.new_crit_edge

.preheader57.us.us.new..preheader57.us.us.new_crit_edge: ; preds = %.preheader57.us.us.new
  br label %.preheader57.us.us.new

.preheader56:                                     ; preds = %._crit_edge70.us
  %74 = icmp sgt i32 %0, 0
  br i1 %74, label %.preheader.us.preheader, label %.preheader56.._crit_edge65_crit_edge

.preheader56.._crit_edge65_crit_edge:             ; preds = %.preheader56
  br label %._crit_edge65

.preheader.us.preheader:                          ; preds = %.preheader56
  %75 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %wide.trip.count95 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  %76 = add nsw i32 %xtraiter, -1
  %77 = zext i32 %76 to i64
  %78 = add nuw nsw i64 %77, 1
  %79 = icmp eq i32 %xtraiter, 0
  %80 = icmp ult i32 %75, 3
  %81 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %82 = bitcast i8* %25 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv93 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next94, %._crit_edge.us..preheader.us_crit_edge ]
  br i1 %79, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv93, i64 %indvars.iv.prol
  %84 = bitcast double* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.prol
  %87 = bitcast double* %86 to i64*
  store i64 %85, i64* %87, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us..prol.loopexit_crit_edge ], [ %78, %.prol.loopexit.loopexit ]
  br i1 %80, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond, label %._crit_edge65.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge65.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %.preheader56.._crit_edge65_crit_edge, %.preheader59.._crit_edge65_crit_edge, %._crit_edge90.._crit_edge65_crit_edge, %._crit_edge65.loopexit, %._crit_edge90.thread
  %108 = phi i8* [ %4, %._crit_edge90.thread ], [ %25, %._crit_edge90.._crit_edge65_crit_edge ], [ %25, %.preheader59.._crit_edge65_crit_edge ], [ %25, %.preheader56.._crit_edge65_crit_edge ], [ %25, %._crit_edge65.loopexit ]
  tail call void @free(i8* %108) #4
  ret void

._crit_edge81.us.3:                               ; preds = %._crit_edge81.us.3.._crit_edge81.us.3_crit_edge, %._crit_edge81.us.3.preheader.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr152, %._crit_edge81.us.3.preheader.new ], [ %indvars.iv.next117.3.1, %._crit_edge81.us.3.._crit_edge81.us.3_crit_edge ]
  %109 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %25, i64 %109
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %29, i32 8, i1 false)
  %110 = mul i64 %indvars.iv116, 16000
  %111 = add i64 %110, 16000
  %scevgep.1 = getelementptr i8, i8* %25, i64 %111
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %29, i32 8, i1 false)
  %112 = mul i64 %indvars.iv116, 16000
  %113 = add i64 %112, 32000
  %scevgep.2 = getelementptr i8, i8* %25, i64 %113
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %29, i32 8, i1 false)
  %114 = mul i64 %indvars.iv116, 16000
  %115 = add i64 %114, 48000
  %scevgep.3 = getelementptr i8, i8* %25, i64 %115
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next117.3 = add nsw i64 %indvars.iv116, 4
  %116 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.1153 = getelementptr i8, i8* %25, i64 %116
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1153, i8 0, i64 %29, i32 8, i1 false)
  %117 = mul i64 %indvars.iv.next117.3, 16000
  %118 = add i64 %117, 16000
  %scevgep.1.1 = getelementptr i8, i8* %25, i64 %118
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %29, i32 8, i1 false)
  %119 = mul i64 %indvars.iv.next117.3, 16000
  %120 = add i64 %119, 32000
  %scevgep.2.1 = getelementptr i8, i8* %25, i64 %120
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %29, i32 8, i1 false)
  %121 = mul i64 %indvars.iv.next117.3, 16000
  %122 = add i64 %121, 48000
  %scevgep.3.1 = getelementptr i8, i8* %25, i64 %122
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, %wide.trip.count118.3
  br i1 %exitcond119.3.1, label %.preheader59.unr-lcssa, label %._crit_edge81.us.3.._crit_edge81.us.3_crit_edge

._crit_edge81.us.3.._crit_edge81.us.3_crit_edge:  ; preds = %._crit_edge81.us.3
  br label %._crit_edge81.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader35.preheader, label %.._crit_edge46_crit_edge

.._crit_edge46_crit_edge:                         ; preds = %2
  br label %._crit_edge46

.preheader35.preheader:                           ; preds = %2
  %wide.trip.count82 = zext i32 %0 to i64
  %wide.trip.count76 = zext i32 %0 to i64
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge42..preheader35_crit_edge, %.preheader35.preheader
  %indvars.iv80 = phi i64 [ 0, %.preheader35.preheader ], [ %indvars.iv.next81, %._crit_edge42..preheader35_crit_edge ]
  %4 = add nuw i64 %indvars.iv80, 4294967295
  %5 = icmp sgt i64 %indvars.iv80, 0
  br i1 %5, label %.preheader33.preheader, label %.preheader35.._crit_edge42_crit_edge

.preheader35.._crit_edge42_crit_edge:             ; preds = %.preheader35
  br label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  br label %.preheader33

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %7 = icmp sgt i64 %indvars.iv80, 0
  br i1 %7, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge42_crit_edge

.preheader.lr.ph.._crit_edge42_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge42

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter6984 = and i64 %indvars.iv80, 1
  %8 = trunc i64 %4 to i32
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  %10 = icmp eq i64 %xtraiter6984, 0
  %11 = icmp eq i32 %8, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge40.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv80, %.preheader.us.preheader ], [ %indvars.iv.next75, %._crit_edge40.us..preheader.us_crit_edge ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv74
  %.pre50 = load double, double* %12, align 8
  br i1 %10, label %.preheader.us..prol.loopexit68_crit_edge, label %13

.preheader.us..prol.loopexit68_crit_edge:         ; preds = %.preheader.us
  br label %.prol.loopexit68

; <label>:13:                                     ; preds = %.preheader.us
  %14 = load double, double* %9, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv74
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre50, %17
  store double %18, double* %12, align 8
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.preheader.us..prol.loopexit68_crit_edge, %13
  %indvars.iv62.unr.ph = phi i64 [ 1, %13 ], [ 0, %.preheader.us..prol.loopexit68_crit_edge ]
  %.unr71.ph = phi double [ %18, %13 ], [ %.pre50, %.preheader.us..prol.loopexit68_crit_edge ]
  br i1 %11, label %.prol.loopexit68.._crit_edge40.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit68.._crit_edge40.us_crit_edge:      ; preds = %.prol.loopexit68
  br label %._crit_edge40.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit68
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv62.unr.ph, %.preheader.us.new.preheader ]
  %19 = phi double [ %31, %.preheader.us.new..preheader.us.new_crit_edge ], [ %.unr71.ph, %.preheader.us.new.preheader ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv62
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv74
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next63
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next63, i64 %indvars.iv74
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %12, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond66.1 = icmp eq i64 %indvars.iv.next63.1, %indvars.iv80
  br i1 %exitcond66.1, label %._crit_edge40.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge40.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %.prol.loopexit68.._crit_edge40.us_crit_edge, %._crit_edge40.us.loopexit
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge42.loopexit, label %._crit_edge40.us..preheader.us_crit_edge

._crit_edge40.us..preheader.us_crit_edge:         ; preds = %._crit_edge40.us
  br label %.preheader.us

.preheader33:                                     ; preds = %._crit_edge..preheader33_crit_edge, %.preheader33.preheader
  %indvars.iv56 = phi i64 [ 0, %.preheader33.preheader ], [ %indvars.iv.next57, %._crit_edge..preheader33_crit_edge ]
  %32 = add nuw i64 %indvars.iv56, 4294967295
  %33 = icmp sgt i64 %indvars.iv56, 0
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv56
  %.pre = load double, double* %34, align 8
  br i1 %33, label %.lr.ph, label %.preheader33.._crit_edge_crit_edge

.preheader33.._crit_edge_crit_edge:               ; preds = %.preheader33
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter85 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %35

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

; <label>:35:                                     ; preds = %.lr.ph
  %36 = load double, double* %6, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv56
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %.pre, %39
  store double %40, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %35
  %indvars.iv.unr.ph = phi i64 [ 1, %35 ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %40, %35 ], [ %.pre, %.lr.ph..prol.loopexit_crit_edge ]
  %.lcssa.unr.ph = phi double [ %40, %35 ], [ undef, %.lr.ph..prol.loopexit_crit_edge ]
  %41 = trunc i64 %32 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %43 = phi double [ %55, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv56
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv56
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %49, %54
  store double %55, double* %34, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv56
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.preheader33.._crit_edge_crit_edge, %._crit_edge.loopexit
  %56 = phi double [ %.pre, %.preheader33.._crit_edge_crit_edge ], [ %.lcssa.unr.ph, %.prol.loopexit.._crit_edge_crit_edge ], [ %55, %._crit_edge.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv56
  %58 = load double, double* %57, align 8
  %59 = fdiv double %56, %58
  store double %59, double* %34, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv80
  br i1 %exitcond, label %.preheader.lr.ph, label %._crit_edge..preheader33_crit_edge

._crit_edge..preheader33_crit_edge:               ; preds = %._crit_edge
  br label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %.preheader.lr.ph.._crit_edge42_crit_edge, %.preheader35.._crit_edge42_crit_edge, %._crit_edge42.loopexit
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
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
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %2
  br label %._crit_edge11

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count14 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us..preheader.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv12, %8
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge.._crit_edge16_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge16_crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge16.._crit_edge_crit_edge

._crit_edge16.._crit_edge_crit_edge:              ; preds = %._crit_edge16
  br label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge16
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge16.._crit_edge_crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge16_crit_edge

._crit_edge.._crit_edge16_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge16

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
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
