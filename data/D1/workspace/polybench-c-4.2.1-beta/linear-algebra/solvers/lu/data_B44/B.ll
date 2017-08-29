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

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
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
  %6 = sext i32 %0 to i64
  %7 = zext i32 %0 to i64
  %8 = shl nuw nsw i64 %7, 3
  %9 = add nsw i64 %8, -8
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88..lr.ph84_crit_edge, %.preheader62.lr.ph
  %indvars.iv131 = phi i64 [ 0, %.preheader62.lr.ph ], [ %indvars.iv.next132, %._crit_edge88..lr.ph84_crit_edge ]
  %indvars.iv129 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next130, %._crit_edge88..lr.ph84_crit_edge ]
  %10 = mul i64 %indvars.iv131, 2001
  br label %._crit_edge

.preheader61:                                     ; preds = %._crit_edge
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %11 = icmp slt i64 %indvars.iv.next132, %6
  br i1 %11, label %.lr.ph87.preheader, label %._crit_edge88

.lr.ph87.preheader:                               ; preds = %.preheader61
  %12 = add i64 %10, 1
  %13 = mul i64 %indvars.iv131, -8
  %14 = add i64 %9, %13
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %12
  %15 = bitcast double* %scevgep142 to i8*
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge88

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph84
  %indvars.iv117 = phi i64 [ 0, %.lr.ph84 ], [ %indvars.iv.next118, %._crit_edge ]
  %16 = sub nsw i64 0, %indvars.iv117
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv117
  store double %21, double* %22, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next118, %indvars.iv129
  br i1 %exitcond122, label %.preheader61, label %._crit_edge

._crit_edge88:                                    ; preds = %.preheader61, %.lr.ph87.preheader
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %23, align 8
  %exitcond134 = icmp eq i64 %indvars.iv.next132, %7
  br i1 %exitcond134, label %.preheader60.us.preheader, label %._crit_edge88..lr.ph84_crit_edge

._crit_edge88..lr.ph84_crit_edge:                 ; preds = %._crit_edge88
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  br label %.lr.ph84

.preheader60.us.preheader:                        ; preds = %._crit_edge88
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %25 = add nsw i64 %7, -1
  %xtraiter148 = and i64 %7, 7
  %lcmp.mod = icmp eq i64 %xtraiter148, 0
  br i1 %lcmp.mod, label %._crit_edge81.us.prol.loopexit, label %._crit_edge81.us.prol.preheader

._crit_edge81.us.prol.preheader:                  ; preds = %.preheader60.us.preheader
  br label %._crit_edge81.us.prol

._crit_edge81.us.prol:                            ; preds = %._crit_edge81.us.prol, %._crit_edge81.us.prol.preheader
  %indvars.iv113.prol = phi i64 [ 0, %._crit_edge81.us.prol.preheader ], [ %indvars.iv.next114.prol, %._crit_edge81.us.prol ]
  %prol.iter149 = phi i64 [ %xtraiter148, %._crit_edge81.us.prol.preheader ], [ %prol.iter149.sub, %._crit_edge81.us.prol ]
  %26 = mul nuw nsw i64 %indvars.iv113.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next114.prol = add nuw nsw i64 %indvars.iv113.prol, 1
  %prol.iter149.sub = add i64 %prol.iter149, -1
  %prol.iter149.cmp = icmp eq i64 %prol.iter149.sub, 0
  br i1 %prol.iter149.cmp, label %._crit_edge81.us.prol.loopexit.unr-lcssa, label %._crit_edge81.us.prol, !llvm.loop !1

._crit_edge81.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge81.us.prol
  br label %._crit_edge81.us.prol.loopexit

._crit_edge81.us.prol.loopexit:                   ; preds = %.preheader60.us.preheader, %._crit_edge81.us.prol.loopexit.unr-lcssa
  %indvars.iv113.unr = phi i64 [ 0, %.preheader60.us.preheader ], [ %indvars.iv.next114.prol, %._crit_edge81.us.prol.loopexit.unr-lcssa ]
  %27 = icmp ult i64 %25, 7
  br i1 %27, label %.preheader58.lr.ph, label %.preheader60.us.preheader.new

.preheader60.us.preheader.new:                    ; preds = %._crit_edge81.us.prol.loopexit
  br label %._crit_edge81.us

._crit_edge81.us:                                 ; preds = %._crit_edge81.us, %.preheader60.us.preheader.new
  %indvars.iv113 = phi i64 [ %indvars.iv113.unr, %.preheader60.us.preheader.new ], [ %indvars.iv.next114.7, %._crit_edge81.us ]
  %28 = mul nuw nsw i64 %indvars.iv113, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %8, i32 8, i1 false)
  %29 = mul i64 %indvars.iv113, 16000
  %30 = add i64 %29, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %8, i32 8, i1 false)
  %31 = mul i64 %indvars.iv113, 16000
  %32 = add i64 %31, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %8, i32 8, i1 false)
  %33 = mul i64 %indvars.iv113, 16000
  %34 = add i64 %33, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %8, i32 8, i1 false)
  %35 = mul i64 %indvars.iv113, 16000
  %36 = add i64 %35, 64000
  %scevgep.4 = getelementptr i8, i8* %24, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %8, i32 8, i1 false)
  %37 = mul i64 %indvars.iv113, 16000
  %38 = add i64 %37, 80000
  %scevgep.5 = getelementptr i8, i8* %24, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %8, i32 8, i1 false)
  %39 = mul i64 %indvars.iv113, 16000
  %40 = add i64 %39, 96000
  %scevgep.6 = getelementptr i8, i8* %24, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %8, i32 8, i1 false)
  %41 = mul i64 %indvars.iv113, 16000
  %42 = add i64 %41, 112000
  %scevgep.7 = getelementptr i8, i8* %24, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next114.7 = add nsw i64 %indvars.iv113, 8
  %exitcond116.7 = icmp eq i64 %indvars.iv.next114.7, %7
  br i1 %exitcond116.7, label %.preheader58.lr.ph.unr-lcssa, label %._crit_edge81.us

.preheader58.lr.ph.unr-lcssa:                     ; preds = %._crit_edge81.us
  br label %.preheader58.lr.ph

.preheader58.lr.ph:                               ; preds = %._crit_edge81.us.prol.loopexit, %.preheader58.lr.ph.unr-lcssa
  %xtraiter140 = and i64 %7, 1
  %43 = icmp eq i64 %xtraiter140, 0
  %44 = icmp eq i32 %0, 1
  %45 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %46 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %._crit_edge70.us, %.preheader58.lr.ph
  %indvars.iv105 = phi i64 [ 0, %.preheader58.lr.ph ], [ %indvars.iv.next106, %._crit_edge70.us ]
  %sunkaddr145 = shl i64 %indvars.iv105, 3
  %sunkaddr146 = add i64 %sunkaddr, %sunkaddr145
  %sunkaddr147 = inttoptr i64 %sunkaddr146 to double*
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, %7
  br i1 %exitcond108, label %.preheader.us.preheader, label %.preheader57.us.us.preheader

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv101 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next102, %._crit_edge68.us.us ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv105
  br i1 %43, label %.prol.loopexit139, label %48

; <label>:48:                                     ; preds = %.preheader57.us.us
  %49 = load double, double* %47, align 8
  %50 = load double, double* %sunkaddr147, align 8
  %51 = fmul double %49, %50
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv101, i64 0
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  br label %.prol.loopexit139

.prol.loopexit139:                                ; preds = %.preheader57.us.us, %48
  %indvars.iv97.unr.ph = phi i64 [ 1, %48 ], [ 0, %.preheader57.us.us ]
  br i1 %44, label %._crit_edge68.us.us, label %.preheader57.us.us.new.preheader

.preheader57.us.us.new.preheader:                 ; preds = %.prol.loopexit139
  br label %.preheader57.us.us.new

._crit_edge68.us.us.loopexit:                     ; preds = %.preheader57.us.us.new
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %._crit_edge68.us.us.loopexit, %.prol.loopexit139
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next102, %7
  br i1 %exitcond104, label %._crit_edge70.us, label %.preheader57.us.us

.preheader57.us.us.new:                           ; preds = %.preheader57.us.us.new.preheader, %.preheader57.us.us.new
  %indvars.iv97 = phi i64 [ %indvars.iv.next98.1, %.preheader57.us.us.new ], [ %indvars.iv97.unr.ph, %.preheader57.us.us.new.preheader ]
  %55 = load double, double* %47, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv105
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %62 = load double, double* %47, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next98, i64 %indvars.iv105
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next98.1 = add nuw nsw i64 %indvars.iv97, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next98.1, %7
  br i1 %exitcond.1, label %._crit_edge68.us.us.loopexit, label %.preheader57.us.us.new

.preheader.us.preheader:                          ; preds = %._crit_edge70.us
  %69 = add nsw i64 %7, -1
  %xtraiter = and i64 %7, 3
  %70 = icmp eq i64 %xtraiter, 0
  %71 = icmp ult i64 %69, 3
  %72 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %73 = bitcast i8* %24 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv92 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next93, %._crit_edge.us ]
  br i1 %70, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv92, i64 %indvars.iv.prol
  %75 = bitcast double* %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv.prol
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %xtraiter, %.prol.loopexit.loopexit ]
  br i1 %71, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv92, i64 %indvars.iv
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next
  %85 = bitcast double* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv.next
  %88 = bitcast double* %87 to i64*
  store i64 %86, i64* %88, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond136.3 = icmp eq i64 %indvars.iv.next.3, %7
  br i1 %exitcond136.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next93, %7
  br i1 %exitcond95, label %._crit_edge65.loopexit, label %.preheader.us

._crit_edge65.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %._crit_edge90.thread
  %99 = phi i8* [ %4, %._crit_edge90.thread ], [ %24, %._crit_edge65.loopexit ]
  tail call void @free(i8* %99) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader35.preheader, label %._crit_edge46

.preheader35.preheader:                           ; preds = %2
  %4 = zext i32 %0 to i64
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge42, %.preheader35.preheader
  %indvars.iv64 = phi i64 [ 0, %.preheader35.preheader ], [ %indvars.iv.next65, %._crit_edge42 ]
  %5 = icmp sgt i64 %indvars.iv64, 0
  br i1 %5, label %.preheader33.preheader, label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 0
  br label %.preheader33

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter72 = and i64 %indvars.iv64, 1
  %7 = icmp eq i64 %xtraiter72, 0
  %8 = icmp eq i64 %indvars.iv64, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge40.us, %.preheader.us.preheader
  %indvars.iv60 = phi i64 [ %indvars.iv64, %.preheader.us.preheader ], [ %indvars.iv.next61, %._crit_edge40.us ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv60
  %.pre69 = load double, double* %9, align 8
  br i1 %7, label %.prol.loopexit71, label %10

; <label>:10:                                     ; preds = %.preheader.us
  %11 = load double, double* %6, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv60
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre69, %14
  store double %15, double* %9, align 8
  br label %.prol.loopexit71

.prol.loopexit71:                                 ; preds = %.preheader.us, %10
  %.unr74.ph = phi double [ %15, %10 ], [ %.pre69, %.preheader.us ]
  %indvars.iv55.unr.ph = phi i64 [ 1, %10 ], [ 0, %.preheader.us ]
  br i1 %8, label %._crit_edge40.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit71
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %16 = phi double [ %28, %.preheader.us.new ], [ %.unr74.ph, %.preheader.us.new.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.preheader.us.new ], [ %indvars.iv55.unr.ph, %.preheader.us.new.preheader ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv55
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv60
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %9, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv.next56
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next56, i64 %indvars.iv60
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %9, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next56.1, %indvars.iv64
  br i1 %exitcond57.1, label %._crit_edge40.us.loopexit, label %.preheader.us.new

._crit_edge40.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit71
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, %4
  br i1 %exitcond, label %._crit_edge42.loopexit, label %.preheader.us

.preheader33:                                     ; preds = %._crit_edge, %.preheader33.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader33.preheader ], [ %indvars.iv.next51, %._crit_edge ]
  %29 = icmp sgt i64 %indvars.iv50, 0
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv50
  %.pre = load double, double* %30, align 8
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter = and i64 %indvars.iv50, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %31

; <label>:31:                                     ; preds = %.lr.ph
  %32 = load double, double* %6, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv50
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %.pre, %35
  store double %36, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %31
  %.lcssa.unr.ph = phi double [ %36, %31 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %36, %31 ], [ %.pre, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %31 ], [ 0, %.lr.ph ]
  %37 = icmp eq i64 %indvars.iv50, 1
  br i1 %37, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %38 = phi double [ %50, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv50
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv50
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv50
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader33
  %51 = phi double [ %.pre, %.preheader33 ], [ %.lcssa.unr.ph, %.prol.loopexit ], [ %50, %._crit_edge.loopexit ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv50
  %53 = load double, double* %52, align 8
  %54 = fdiv double %51, %53
  store double %54, double* %30, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %indvars.iv64
  br i1 %exitcond53, label %.preheader.us.preheader, label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader35
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next65, %4
  br i1 %exitcond75, label %._crit_edge46.loopexit, label %.preheader35

._crit_edge46.loopexit:                           ; preds = %._crit_edge42
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %2
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %10 = mul nsw i64 %indvars.iv12, %8
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %11 = add nsw i64 %indvars.iv, %10
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %._crit_edge17
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge17, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond16, label %._crit_edge.us, label %._crit_edge17

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %9
  br i1 %exitcond15, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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
