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
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader62.lr.ph, label %._crit_edge90.thread

._crit_edge90.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge65

.preheader62.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count142 = zext i32 %0 to i64
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88, %.preheader62.lr.ph
  %indvars.iv140 = phi i64 [ 0, %.preheader62.lr.ph ], [ %9, %._crit_edge88 ]
  %indvars.iv138 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next139, %._crit_edge88 ]
  %9 = add nuw nsw i64 %indvars.iv140, 1
  %10 = sub i64 %7, %indvars.iv140
  %11 = shl i64 %10, 3
  %12 = and i64 %11, 34359738360
  br label %16

.preheader61:                                     ; preds = %16
  %13 = icmp slt i64 %9, %8
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
  %exitcond143 = icmp eq i64 %9, %wide.trip.count142
  br i1 %exitcond143, label %.preheader60.us.preheader, label %.lr.ph84

.preheader60.us.preheader:                        ; preds = %._crit_edge88
  %25 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %26 = add i32 %0, -1
  %27 = zext i32 %26 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = add nuw nsw i64 %28, 8
  %xtraiter120 = and i32 %0, 3
  %lcmp.mod121 = icmp eq i32 %xtraiter120, 0
  br i1 %lcmp.mod121, label %.preheader60.us.prol.loopexit, label %._crit_edge81.us.prol.preheader

._crit_edge81.us.prol.preheader:                  ; preds = %.preheader60.us.preheader
  %30 = add nsw i32 %xtraiter120, -1
  %31 = zext i32 %30 to i64
  br label %._crit_edge81.us.prol

._crit_edge81.us.prol:                            ; preds = %._crit_edge81.us.prol.preheader, %._crit_edge81.us.prol
  %indvars.iv116.prol = phi i64 [ %indvars.iv.next117.prol, %._crit_edge81.us.prol ], [ 0, %._crit_edge81.us.prol.preheader ]
  %prol.iter122 = phi i32 [ %prol.iter122.sub, %._crit_edge81.us.prol ], [ %xtraiter120, %._crit_edge81.us.prol.preheader ]
  %32 = mul nuw nsw i64 %indvars.iv116.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %25, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next117.prol = add nuw nsw i64 %indvars.iv116.prol, 1
  %prol.iter122.sub = add nsw i32 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i32 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %.preheader60.us.prol.loopexit.loopexit, label %._crit_edge81.us.prol, !llvm.loop !1

.preheader60.us.prol.loopexit.loopexit:           ; preds = %._crit_edge81.us.prol
  %33 = add nuw nsw i64 %31, 1
  br label %.preheader60.us.prol.loopexit

.preheader60.us.prol.loopexit:                    ; preds = %.preheader60.us.prol.loopexit.loopexit, %.preheader60.us.preheader
  %indvars.iv116.unr = phi i64 [ 0, %.preheader60.us.preheader ], [ %33, %.preheader60.us.prol.loopexit.loopexit ]
  %34 = icmp ult i32 %26, 3
  br i1 %34, label %.preheader58.lr.ph, label %._crit_edge81.us.3.preheader

._crit_edge81.us.3.preheader:                     ; preds = %.preheader60.us.prol.loopexit
  %35 = add nsw i64 %wide.trip.count142, -4
  %36 = sub nsw i64 %35, %indvars.iv116.unr
  %37 = lshr i64 %36, 2
  %38 = and i64 %37, 1
  %lcmp.mod = icmp eq i64 %38, 0
  br i1 %lcmp.mod, label %._crit_edge81.us.3.prol.preheader, label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.preheader:                ; preds = %._crit_edge81.us.3.preheader
  br label %._crit_edge81.us.3.prol

._crit_edge81.us.3.prol:                          ; preds = %._crit_edge81.us.3.prol.preheader
  %39 = mul nsw i64 %indvars.iv116.unr, 16000
  %scevgep.prol150 = getelementptr i8, i8* %25, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol150, i8 0, i64 %29, i32 8, i1 false)
  %40 = add i64 %39, 16000
  %scevgep.1.prol = getelementptr i8, i8* %25, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %29, i32 8, i1 false)
  %41 = add i64 %39, 32000
  %scevgep.2.prol = getelementptr i8, i8* %25, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %29, i32 8, i1 false)
  %42 = add i64 %39, 48000
  %scevgep.3.prol = getelementptr i8, i8* %25, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next117.3.prol = add nsw i64 %indvars.iv116.unr, 4
  br label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.loopexit:                 ; preds = %._crit_edge81.us.3.prol, %._crit_edge81.us.3.preheader
  %indvars.iv116.unr151 = phi i64 [ %indvars.iv116.unr, %._crit_edge81.us.3.preheader ], [ %indvars.iv.next117.3.prol, %._crit_edge81.us.3.prol ]
  %43 = icmp eq i64 %37, 0
  br i1 %43, label %.preheader58.lr.ph.loopexit, label %._crit_edge81.us.3.preheader.new

._crit_edge81.us.3.preheader.new:                 ; preds = %._crit_edge81.us.3.prol.loopexit
  br label %._crit_edge81.us.3

.preheader58.lr.ph.loopexit.unr-lcssa:            ; preds = %._crit_edge81.us.3
  br label %.preheader58.lr.ph.loopexit

.preheader58.lr.ph.loopexit:                      ; preds = %._crit_edge81.us.3.prol.loopexit, %.preheader58.lr.ph.loopexit.unr-lcssa
  br label %.preheader58.lr.ph

.preheader58.lr.ph:                               ; preds = %.preheader58.lr.ph.loopexit, %.preheader60.us.prol.loopexit
  %xtraiter102 = and i32 %0, 1
  %44 = icmp eq i32 %xtraiter102, 0
  %45 = icmp eq i32 %0, 1
  %46 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %25 to [2000 x [2000 x double]]*
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
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count142
  br i1 %exitcond111, label %.preheader.us.preheader, label %.preheader57.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge70.us
  %48 = add nsw i32 %xtraiter120, -1
  %49 = zext i32 %48 to i64
  %50 = add nuw nsw i64 %49, 1
  %51 = icmp eq i32 %xtraiter120, 0
  %52 = icmp ult i32 %26, 3
  %53 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %54 = bitcast i8* %25 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge68.us.us ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv108
  br i1 %44, label %.prol.loopexit101, label %56

; <label>:56:                                     ; preds = %.preheader57.us.us
  %57 = load double, double* %55, align 8
  %58 = load double, double* %sunkaddr148, align 8
  %59 = fmul double %57, %58
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv104, i64 0
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  br label %.prol.loopexit101

.prol.loopexit101:                                ; preds = %.preheader57.us.us, %56
  %indvars.iv96.unr.ph = phi i64 [ 1, %56 ], [ 0, %.preheader57.us.us ]
  br i1 %45, label %._crit_edge68.us.us, label %.preheader57.us.us.new.preheader

.preheader57.us.us.new.preheader:                 ; preds = %.prol.loopexit101
  br label %.preheader57.us.us.new

._crit_edge68.us.us.loopexit:                     ; preds = %.preheader57.us.us.new
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %._crit_edge68.us.us.loopexit, %.prol.loopexit101
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, %wide.trip.count142
  br i1 %exitcond107, label %._crit_edge70.us, label %.preheader57.us.us

.preheader57.us.us.new:                           ; preds = %.preheader57.us.us.new.preheader, %.preheader57.us.us.new
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %.preheader57.us.us.new ], [ %indvars.iv96.unr.ph, %.preheader57.us.us.new.preheader ]
  %63 = load double, double* %55, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv108
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv104, i64 %indvars.iv96
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %70 = load double, double* %55, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next97, i64 %indvars.iv108
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next97
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %73
  store double %76, double* %74, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, %wide.trip.count142
  br i1 %exitcond99.1, label %._crit_edge68.us.us.loopexit, label %.preheader57.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %51, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter120, %.prol.preheader.preheader ]
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv93, i64 %indvars.iv.prol
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.prol
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %50, %.prol.loopexit.loopexit ]
  br i1 %52, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %93 = bitcast double* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count142
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, %wide.trip.count142
  br i1 %exitcond, label %._crit_edge65.loopexit, label %.preheader.us

._crit_edge65.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %._crit_edge90.thread
  %102 = phi i8* [ %4, %._crit_edge90.thread ], [ %25, %._crit_edge65.loopexit ]
  tail call void @free(i8* %102) #3
  ret void

._crit_edge81.us.3:                               ; preds = %._crit_edge81.us.3, %._crit_edge81.us.3.preheader.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr151, %._crit_edge81.us.3.preheader.new ], [ %indvars.iv.next117.3.1, %._crit_edge81.us.3 ]
  %103 = mul i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %25, i64 %103
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %29, i32 8, i1 false)
  %104 = add i64 %103, 16000
  %scevgep.1 = getelementptr i8, i8* %25, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %29, i32 8, i1 false)
  %105 = add i64 %103, 32000
  %scevgep.2 = getelementptr i8, i8* %25, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %29, i32 8, i1 false)
  %106 = add i64 %103, 48000
  %scevgep.3 = getelementptr i8, i8* %25, i64 %106
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %29, i32 8, i1 false)
  %107 = mul i64 %indvars.iv116, 16000
  %108 = add i64 %107, 64000
  %scevgep.1152 = getelementptr i8, i8* %25, i64 %108
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1152, i8 0, i64 %29, i32 8, i1 false)
  %109 = add i64 %107, 80000
  %scevgep.1.1 = getelementptr i8, i8* %25, i64 %109
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %29, i32 8, i1 false)
  %110 = add i64 %107, 96000
  %scevgep.2.1 = getelementptr i8, i8* %25, i64 %110
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %29, i32 8, i1 false)
  %111 = add i64 %107, 112000
  %scevgep.3.1 = getelementptr i8, i8* %25, i64 %111
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, %wide.trip.count142
  br i1 %exitcond119.3.1, label %.preheader58.lr.ph.loopexit.unr-lcssa, label %._crit_edge81.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader35.preheader, label %._crit_edge46

.preheader35.preheader:                           ; preds = %2
  %wide.trip.count82 = zext i32 %0 to i64
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.preheader, %._crit_edge42
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge42 ], [ 0, %.preheader35.preheader ]
  %4 = add nuw i64 %indvars.iv80, 4294967295
  %5 = icmp sgt i64 %indvars.iv80, 0
  br i1 %5, label %.preheader33.preheader, label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  br label %.preheader33

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter6984 = and i64 %indvars.iv80, 1
  %7 = trunc i64 %4 to i32
  %8 = icmp eq i64 %xtraiter6984, 0
  %9 = icmp eq i32 %7, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge40.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge40.us ], [ %indvars.iv80, %.preheader.us.preheader ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv74
  %.pre50 = load double, double* %10, align 8
  br i1 %8, label %.prol.loopexit68, label %11

; <label>:11:                                     ; preds = %.preheader.us
  %12 = load double, double* %6, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv74
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %.pre50, %15
  store double %16, double* %10, align 8
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.preheader.us, %11
  %indvars.iv62.unr.ph = phi i64 [ 1, %11 ], [ 0, %.preheader.us ]
  %.unr71.ph = phi double [ %16, %11 ], [ %.pre50, %.preheader.us ]
  br i1 %9, label %._crit_edge40.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit68
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.preheader.us.new ], [ %indvars.iv62.unr.ph, %.preheader.us.new.preheader ]
  %17 = phi double [ %29, %.preheader.us.new ], [ %.unr71.ph, %.preheader.us.new.preheader ]
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
  br i1 %exitcond66.1, label %._crit_edge40.us.loopexit, label %.preheader.us.new

._crit_edge40.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit68
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count82
  br i1 %exitcond77, label %._crit_edge42.loopexit, label %.preheader.us

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge ], [ 0, %.preheader33.preheader ]
  %30 = add nuw i64 %indvars.iv56, 4294967295
  %31 = icmp sgt i64 %indvars.iv56, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv56
  %.pre = load double, double* %32, align 8
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter85 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %33

; <label>:33:                                     ; preds = %.lr.ph
  %34 = load double, double* %6, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv56
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %.pre, %37
  store double %38, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %33
  %indvars.iv.unr.ph = phi i64 [ 1, %33 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %38, %33 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %38, %33 ], [ undef, %.lr.ph ]
  %39 = trunc i64 %30 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %41 = phi double [ %53, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
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
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader33, %.prol.loopexit
  %54 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader33 ], [ %53, %._crit_edge.loopexit ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv56
  %56 = load double, double* %55, align 8
  %57 = fdiv double %54, %56
  store double %57, double* %32, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv80
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader35
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
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count
  br i1 %exitcond15, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
