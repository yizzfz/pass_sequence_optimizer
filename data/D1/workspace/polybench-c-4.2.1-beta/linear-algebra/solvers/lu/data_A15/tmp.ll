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
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
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

.lr.ph84:                                         ; preds = %._crit_edge88, %.preheader62.lr.ph
  %indvars.iv140 = phi i64 [ 0, %.preheader62.lr.ph ], [ %indvars.iv.next141, %._crit_edge88 ]
  %indvars.iv138 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next139, %._crit_edge88 ]
  %9 = add nuw nsw i64 %indvars.iv140, 1
  %10 = sub i64 %7, %indvars.iv140
  %11 = shl i64 %10, 3
  %12 = and i64 %11, 34359738360
  br label %16

.preheader61:                                     ; preds = %16
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %13 = icmp slt i64 %indvars.iv.next141, %8
  br i1 %13, label %.lr.ph87.preheader, label %._crit_edge88

.lr.ph87.preheader:                               ; preds = %.preheader61
  %14 = add nuw nsw i64 %12, 8
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %9
  %15 = mul nuw nsw i64 %indvars.iv140, 2000
  %scevgep136 = getelementptr double, double* %scevgep135, i64 %15
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep136137, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge88

; <label>:16:                                     ; preds = %16, %.lr.ph84
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %16 ], [ 0, %.lr.ph84 ]
  %17 = sub nsw i64 0, %indvars.iv123
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, %0
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %5
  %22 = fadd double %21, 1.000000e+00
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv123
  store double %22, double* %23, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next124, %indvars.iv138
  br i1 %exitcond128, label %.preheader61, label %16

._crit_edge88:                                    ; preds = %.lr.ph87.preheader, %.preheader61
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %24, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond143, label %._crit_edge90, label %.lr.ph84

._crit_edge90:                                    ; preds = %._crit_edge88
  %25 = icmp sgt i32 %0, 0
  %26 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 %25, label %.preheader60.us.preheader, label %._crit_edge65

.preheader60.us.preheader:                        ; preds = %._crit_edge90
  %27 = add i32 %0, -1
  %28 = zext i32 %27 to i64
  %29 = shl nuw nsw i64 %28, 3
  %30 = add nuw nsw i64 %29, 8
  %xtraiter120 = and i32 %0, 3
  %lcmp.mod121 = icmp eq i32 %xtraiter120, 0
  br i1 %lcmp.mod121, label %.preheader60.us.prol.loopexit, label %._crit_edge81.us.prol.preheader

._crit_edge81.us.prol.preheader:                  ; preds = %.preheader60.us.preheader
  %31 = add nsw i32 %xtraiter120, -1
  %32 = zext i32 %31 to i64
  br label %._crit_edge81.us.prol

._crit_edge81.us.prol:                            ; preds = %._crit_edge81.us.prol.preheader, %._crit_edge81.us.prol
  %indvars.iv116.prol = phi i64 [ %indvars.iv.next117.prol, %._crit_edge81.us.prol ], [ 0, %._crit_edge81.us.prol.preheader ]
  %prol.iter122 = phi i32 [ %prol.iter122.sub, %._crit_edge81.us.prol ], [ %xtraiter120, %._crit_edge81.us.prol.preheader ]
  %33 = mul nuw nsw i64 %indvars.iv116.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %26, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next117.prol = add nuw nsw i64 %indvars.iv116.prol, 1
  %prol.iter122.sub = add nsw i32 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i32 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %.preheader60.us.prol.loopexit.loopexit, label %._crit_edge81.us.prol, !llvm.loop !1

.preheader60.us.prol.loopexit.loopexit:           ; preds = %._crit_edge81.us.prol
  %34 = add nuw nsw i64 %32, 1
  br label %.preheader60.us.prol.loopexit

.preheader60.us.prol.loopexit:                    ; preds = %.preheader60.us.prol.loopexit.loopexit, %.preheader60.us.preheader
  %indvars.iv116.unr = phi i64 [ 0, %.preheader60.us.preheader ], [ %34, %.preheader60.us.prol.loopexit.loopexit ]
  %35 = icmp ult i32 %27, 3
  br i1 %35, label %.preheader58.lr.ph, label %._crit_edge81.us.3.preheader

._crit_edge81.us.3.preheader:                     ; preds = %.preheader60.us.prol.loopexit
  %wide.trip.count118.3 = zext i32 %0 to i64
  %36 = add nsw i64 %wide.trip.count118.3, -4
  %37 = sub nsw i64 %36, %indvars.iv116.unr
  %38 = lshr i64 %37, 2
  %39 = and i64 %38, 1
  %lcmp.mod = icmp eq i64 %39, 0
  br i1 %lcmp.mod, label %._crit_edge81.us.3.prol.preheader, label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.preheader:                ; preds = %._crit_edge81.us.3.preheader
  br label %._crit_edge81.us.3.prol

._crit_edge81.us.3.prol:                          ; preds = %._crit_edge81.us.3.prol.preheader
  %40 = mul nuw nsw i64 %indvars.iv116.unr, 16000
  %scevgep.prol151 = getelementptr i8, i8* %26, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol151, i8 0, i64 %30, i32 8, i1 false)
  %41 = mul nsw i64 %indvars.iv116.unr, 16000
  %42 = add i64 %41, 16000
  %scevgep.1.prol = getelementptr i8, i8* %26, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %30, i32 8, i1 false)
  %43 = mul nsw i64 %indvars.iv116.unr, 16000
  %44 = add i64 %43, 32000
  %scevgep.2.prol = getelementptr i8, i8* %26, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %30, i32 8, i1 false)
  %45 = mul nsw i64 %indvars.iv116.unr, 16000
  %46 = add i64 %45, 48000
  %scevgep.3.prol = getelementptr i8, i8* %26, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next117.3.prol = add nsw i64 %indvars.iv116.unr, 4
  br label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.loopexit:                 ; preds = %._crit_edge81.us.3.prol, %._crit_edge81.us.3.preheader
  %indvars.iv116.unr152 = phi i64 [ %indvars.iv116.unr, %._crit_edge81.us.3.preheader ], [ %indvars.iv.next117.3.prol, %._crit_edge81.us.3.prol ]
  %47 = icmp eq i64 %38, 0
  br i1 %47, label %.preheader59, label %._crit_edge81.us.3.preheader.new

._crit_edge81.us.3.preheader.new:                 ; preds = %._crit_edge81.us.3.prol.loopexit
  br label %._crit_edge81.us.3

.preheader59.unr-lcssa:                           ; preds = %._crit_edge81.us.3
  br label %.preheader59

.preheader59:                                     ; preds = %._crit_edge81.us.3.prol.loopexit, %.preheader59.unr-lcssa
  %48 = icmp sgt i32 %0, 0
  br i1 %48, label %.preheader58.lr.ph, label %._crit_edge65

.preheader58.lr.ph:                               ; preds = %.preheader60.us.prol.loopexit, %.preheader59
  %xtraiter102 = and i32 %0, 1
  %wide.trip.count106 = zext i32 %0 to i64
  %wide.trip.count98.1 = zext i32 %0 to i64
  %wide.trip.count110 = zext i32 %0 to i64
  %49 = icmp eq i32 %xtraiter102, 0
  %50 = icmp eq i32 %0, 1
  %51 = bitcast i8* %26 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %26 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %._crit_edge70.us, %.preheader58.lr.ph
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge70.us ], [ 0, %.preheader58.lr.ph ]
  %sunkaddr146 = shl i64 %indvars.iv108, 3
  %sunkaddr147 = add i64 %sunkaddr, %sunkaddr146
  %sunkaddr148 = inttoptr i64 %sunkaddr147 to double*
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count110
  br i1 %exitcond111, label %.preheader56, label %.preheader57.us.us.preheader

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge68.us.us ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv108
  br i1 %49, label %.prol.loopexit101, label %54

; <label>:54:                                     ; preds = %.preheader57.us.us
  %55 = load double, double* %53, align 8
  %56 = load double, double* %sunkaddr148, align 8
  %57 = fmul double %55, %56
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv104, i64 0
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %58, align 8
  br label %.prol.loopexit101

.prol.loopexit101:                                ; preds = %.preheader57.us.us, %54
  %indvars.iv96.unr.ph = phi i64 [ 1, %54 ], [ 0, %.preheader57.us.us ]
  br i1 %50, label %._crit_edge68.us.us, label %.preheader57.us.us.new.preheader

.preheader57.us.us.new.preheader:                 ; preds = %.prol.loopexit101
  br label %.preheader57.us.us.new

._crit_edge68.us.us.loopexit:                     ; preds = %.preheader57.us.us.new
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %._crit_edge68.us.us.loopexit, %.prol.loopexit101
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, %wide.trip.count106
  br i1 %exitcond107, label %._crit_edge70.us, label %.preheader57.us.us

.preheader57.us.us.new:                           ; preds = %.preheader57.us.us.new.preheader, %.preheader57.us.us.new
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %.preheader57.us.us.new ], [ %indvars.iv96.unr.ph, %.preheader57.us.us.new.preheader ]
  %61 = load double, double* %53, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv108
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv104, i64 %indvars.iv96
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %65, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %68 = load double, double* %53, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next97, i64 %indvars.iv108
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next97
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %72, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, %wide.trip.count98.1
  br i1 %exitcond99.1, label %._crit_edge68.us.us.loopexit, label %.preheader57.us.us.new

.preheader56:                                     ; preds = %._crit_edge70.us
  %75 = icmp sgt i32 %0, 0
  br i1 %75, label %.preheader.us.preheader, label %._crit_edge65

.preheader.us.preheader:                          ; preds = %.preheader56
  %76 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %wide.trip.count95 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  %77 = add nsw i32 %xtraiter, -1
  %78 = zext i32 %77 to i64
  %79 = add nuw nsw i64 %78, 1
  %80 = icmp eq i32 %xtraiter, 0
  %81 = icmp ult i32 %76, 3
  %82 = bitcast i8* %26 to [2000 x [2000 x double]]*
  %83 = bitcast i8* %26 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv93 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next94, %._crit_edge.us ]
  br i1 %80, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv93, i64 %indvars.iv.prol
  %85 = bitcast double* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.prol
  %88 = bitcast double* %87 to i64*
  store i64 %86, i64* %88, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %79, %.prol.loopexit.loopexit ]
  br i1 %81, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond, label %._crit_edge65.loopexit, label %.preheader.us

._crit_edge65.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %._crit_edge90, %._crit_edge90.thread, %.preheader59, %.preheader56
  %109 = phi i8* [ %26, %.preheader56 ], [ %26, %.preheader59 ], [ %26, %._crit_edge90 ], [ %4, %._crit_edge90.thread ], [ %26, %._crit_edge65.loopexit ]
  tail call void @free(i8* %109) #4
  ret void

._crit_edge81.us.3:                               ; preds = %._crit_edge81.us.3, %._crit_edge81.us.3.preheader.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr152, %._crit_edge81.us.3.preheader.new ], [ %indvars.iv.next117.3.1, %._crit_edge81.us.3 ]
  %110 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %26, i64 %110
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %30, i32 8, i1 false)
  %111 = mul i64 %indvars.iv116, 16000
  %112 = add i64 %111, 16000
  %scevgep.1 = getelementptr i8, i8* %26, i64 %112
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %30, i32 8, i1 false)
  %113 = mul i64 %indvars.iv116, 16000
  %114 = add i64 %113, 32000
  %scevgep.2 = getelementptr i8, i8* %26, i64 %114
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %30, i32 8, i1 false)
  %115 = mul i64 %indvars.iv116, 16000
  %116 = add i64 %115, 48000
  %scevgep.3 = getelementptr i8, i8* %26, i64 %116
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next117.3 = add nsw i64 %indvars.iv116, 4
  %117 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.1153 = getelementptr i8, i8* %26, i64 %117
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1153, i8 0, i64 %30, i32 8, i1 false)
  %118 = mul i64 %indvars.iv.next117.3, 16000
  %119 = add i64 %118, 16000
  %scevgep.1.1 = getelementptr i8, i8* %26, i64 %119
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %30, i32 8, i1 false)
  %120 = mul i64 %indvars.iv.next117.3, 16000
  %121 = add i64 %120, 32000
  %scevgep.2.1 = getelementptr i8, i8* %26, i64 %121
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %30, i32 8, i1 false)
  %122 = mul i64 %indvars.iv.next117.3, 16000
  %123 = add i64 %122, 48000
  %scevgep.3.1 = getelementptr i8, i8* %26, i64 %123
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, %wide.trip.count118.3
  br i1 %exitcond119.3.1, label %.preheader59.unr-lcssa, label %._crit_edge81.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader35.preheader, label %._crit_edge46

.preheader35.preheader:                           ; preds = %2
  %wide.trip.count82 = zext i32 %0 to i64
  %wide.trip.count76 = zext i32 %0 to i64
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.preheader, %._crit_edge42
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge42 ], [ 0, %.preheader35.preheader ]
  %4 = add nuw i64 %indvars.iv80, 4294967295
  %5 = icmp sgt i64 %indvars.iv80, 0
  br i1 %5, label %.preheader33.preheader, label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  br label %.preheader33

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %7 = icmp sgt i64 %indvars.iv80, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge42

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter6984 = and i64 %indvars.iv80, 1
  %8 = trunc i64 %4 to i32
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  %10 = icmp eq i64 %xtraiter6984, 0
  %11 = icmp eq i32 %8, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge40.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge40.us ], [ %indvars.iv80, %.preheader.us.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv74
  %.pre50 = load double, double* %12, align 8
  br i1 %10, label %.prol.loopexit68, label %13

; <label>:13:                                     ; preds = %.preheader.us
  %14 = load double, double* %9, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv74
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre50, %17
  store double %18, double* %12, align 8
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.preheader.us, %13
  %indvars.iv62.unr.ph = phi i64 [ 1, %13 ], [ 0, %.preheader.us ]
  %.unr71.ph = phi double [ %18, %13 ], [ %.pre50, %.preheader.us ]
  br i1 %11, label %._crit_edge40.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit68
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.preheader.us.new ], [ %indvars.iv62.unr.ph, %.preheader.us.new.preheader ]
  %19 = phi double [ %31, %.preheader.us.new ], [ %.unr71.ph, %.preheader.us.new.preheader ]
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
  br i1 %exitcond66.1, label %._crit_edge40.us.loopexit, label %.preheader.us.new

._crit_edge40.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit68
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge42.loopexit, label %.preheader.us

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge ], [ 0, %.preheader33.preheader ]
  %32 = add nuw i64 %indvars.iv56, 4294967295
  %33 = icmp sgt i64 %indvars.iv56, 0
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv56
  %.pre = load double, double* %34, align 8
  br i1 %33, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter85 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %35

; <label>:35:                                     ; preds = %.lr.ph
  %36 = load double, double* %6, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv56
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %.pre, %39
  store double %40, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %35
  %indvars.iv.unr.ph = phi i64 [ 1, %35 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %40, %35 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %40, %35 ], [ undef, %.lr.ph ]
  %41 = trunc i64 %32 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %43 = phi double [ %55, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
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
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader33, %.prol.loopexit
  %56 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader33 ], [ %55, %._crit_edge.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv56
  %58 = load double, double* %57, align 8
  %59 = fdiv double %56, %58
  store double %59, double* %34, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv80
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader35, %.preheader.lr.ph
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83, label %._crit_edge46.loopexit, label %.preheader35

._crit_edge46.loopexit:                           ; preds = %._crit_edge42
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %2
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
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count14 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv12, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
  br i1 %exitcond15, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
