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
  %.cast = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %.cast)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %.cast)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %4 = icmp sgt i32 %0, 42
  br i1 %4, label %5, label %._crit_edge

; <label>:5:                                      ; preds = %2
  %6 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %6, align 1
  %7 = icmp eq i8 %strcmpload, 0
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %5
  %9 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %2, %8
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = sext i32 %0 to i64
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader58.lr.ph, label %._crit_edge135.thread

._crit_edge135.thread:                            ; preds = %2
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge97

.preheader58.lr.ph:                               ; preds = %2
  %6 = add i32 %0, -1
  %7 = sitofp i32 %0 to double
  %wide.trip.count87 = zext i32 %6 to i64
  %8 = shl nuw nsw i64 %wide.trip.count87, 3
  br label %.preheader58

.preheader58:                                     ; preds = %._crit_edge132, %.preheader58.lr.ph
  %indvars.iv89134 = phi i64 [ 1, %.preheader58.lr.ph ], [ %indvars.iv.next90, %._crit_edge132 ]
  %indvars.iv91133 = phi i64 [ 0, %.preheader58.lr.ph ], [ %indvars.iv.next92, %._crit_edge132 ]
  %9 = mul nuw nsw i64 %indvars.iv91133, 2001
  %10 = add nuw nsw i64 %9, 1
  %11 = mul nsw i64 %indvars.iv91133, -8
  br label %._crit_edge

.preheader57:                                     ; preds = %._crit_edge
  %exitcond88129 = icmp eq i64 %indvars.iv91133, %wide.trip.count87
  br i1 %exitcond88129, label %._crit_edge132, label %.lr.ph131.preheader

.lr.ph131.preheader:                              ; preds = %.preheader57
  %12 = add nsw i64 %8, %11
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %13 = bitcast double* %scevgep150 to i8*
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 %12, i32 8, i1 false)
  br label %._crit_edge132

._crit_edge:                                      ; preds = %._crit_edge, %.preheader58
  %indvars.iv77127 = phi i64 [ 0, %.preheader58 ], [ %indvars.iv.next78, %._crit_edge ]
  %14 = sub nsw i64 0, %indvars.iv77127
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %7
  %19 = fadd double %18, 1.000000e+00
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91133, i64 %indvars.iv77127
  store double %19, double* %20, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77127, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next78, %indvars.iv89134
  br i1 %exitcond82, label %.preheader57, label %._crit_edge

._crit_edge132:                                   ; preds = %.preheader57, %.lr.ph131.preheader
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91133, i64 %indvars.iv91133
  store double 1.000000e+00, double* %21, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91133, 1
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89134, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next92, %3
  br i1 %exitcond152, label %.preheader56.us.preheader, label %.preheader58

.preheader56.us.preheader:                        ; preds = %._crit_edge132
  %22 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %wide.trip.count73 = zext i32 %0 to i64
  %23 = shl nuw nsw i64 %wide.trip.count73, 3
  %24 = add nsw i64 %3, -1
  %xtraiter147 = and i64 %3, 3
  %lcmp.mod148 = icmp eq i64 %xtraiter147, 0
  br i1 %lcmp.mod148, label %.preheader56.us.prol.loopexit, label %._crit_edge124.us.prol.preheader

._crit_edge124.us.prol.preheader:                 ; preds = %.preheader56.us.preheader
  br label %._crit_edge124.us.prol

._crit_edge124.us.prol:                           ; preds = %._crit_edge124.us.prol.preheader, %._crit_edge124.us.prol
  %indvars.iv75125.us.prol = phi i64 [ %indvars.iv.next76.us.prol, %._crit_edge124.us.prol ], [ 0, %._crit_edge124.us.prol.preheader ]
  %prol.iter149 = phi i64 [ %prol.iter149.sub, %._crit_edge124.us.prol ], [ %xtraiter147, %._crit_edge124.us.prol.preheader ]
  %25 = mul nuw nsw i64 %indvars.iv75125.us.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %22, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next76.us.prol = add nuw nsw i64 %indvars.iv75125.us.prol, 1
  %prol.iter149.sub = add nsw i64 %prol.iter149, -1
  %prol.iter149.cmp = icmp eq i64 %prol.iter149.sub, 0
  br i1 %prol.iter149.cmp, label %.preheader56.us.prol.loopexit.loopexit, label %._crit_edge124.us.prol, !llvm.loop !1

.preheader56.us.prol.loopexit.loopexit:           ; preds = %._crit_edge124.us.prol
  br label %.preheader56.us.prol.loopexit

.preheader56.us.prol.loopexit:                    ; preds = %.preheader56.us.prol.loopexit.loopexit, %.preheader56.us.preheader
  %indvars.iv75125.us.unr = phi i64 [ 0, %.preheader56.us.preheader ], [ %xtraiter147, %.preheader56.us.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %24, 3
  br i1 %26, label %.preheader54.us.preheader, label %._crit_edge124.us.3.preheader

._crit_edge124.us.3.preheader:                    ; preds = %.preheader56.us.prol.loopexit
  %27 = add nsw i64 %3, -4
  %28 = sub nsw i64 %27, %indvars.iv75125.us.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod = icmp eq i64 %30, 0
  br i1 %lcmp.mod, label %._crit_edge124.us.3.prol.preheader, label %._crit_edge124.us.3.prol.loopexit

._crit_edge124.us.3.prol.preheader:               ; preds = %._crit_edge124.us.3.preheader
  br label %._crit_edge124.us.3.prol

._crit_edge124.us.3.prol:                         ; preds = %._crit_edge124.us.3.prol.preheader
  %31 = mul nuw nsw i64 %indvars.iv75125.us.unr, 16000
  %scevgep.prol159 = getelementptr i8, i8* %22, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol159, i8 0, i64 %23, i32 8, i1 false)
  %32 = add nuw nsw i64 %31, 16000
  %scevgep.1.prol = getelementptr i8, i8* %22, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %33 = add nuw nsw i64 %31, 32000
  %scevgep.2.prol = getelementptr i8, i8* %22, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %34 = add nuw nsw i64 %31, 48000
  %scevgep.3.prol = getelementptr i8, i8* %22, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next76.us.3.prol = or i64 %indvars.iv75125.us.unr, 4
  br label %._crit_edge124.us.3.prol.loopexit

._crit_edge124.us.3.prol.loopexit:                ; preds = %._crit_edge124.us.3.prol, %._crit_edge124.us.3.preheader
  %indvars.iv75125.us.unr160 = phi i64 [ %indvars.iv75125.us.unr, %._crit_edge124.us.3.preheader ], [ %indvars.iv.next76.us.3.prol, %._crit_edge124.us.3.prol ]
  %35 = icmp eq i64 %29, 0
  br i1 %35, label %.preheader54.us.preheader.loopexit, label %._crit_edge124.us.3.preheader.new

._crit_edge124.us.3.preheader.new:                ; preds = %._crit_edge124.us.3.prol.loopexit
  br label %._crit_edge124.us.3

.preheader54.us.preheader.loopexit.unr-lcssa:     ; preds = %._crit_edge124.us.3
  br label %.preheader54.us.preheader.loopexit

.preheader54.us.preheader.loopexit:               ; preds = %._crit_edge124.us.3.prol.loopexit, %.preheader54.us.preheader.loopexit.unr-lcssa
  br label %.preheader54.us.preheader

.preheader54.us.preheader:                        ; preds = %.preheader54.us.preheader.loopexit, %.preheader56.us.prol.loopexit
  %xtraiter143 = and i64 %wide.trip.count73, 1
  %36 = icmp eq i64 %xtraiter143, 0
  %37 = icmp eq i32 %0, 1
  %38 = bitcast i8* %22 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %22 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader53.us.us.preheader

.preheader53.us.us.preheader:                     ; preds = %._crit_edge105.us, %.preheader54.us.preheader
  %indvars.iv69106.us = phi i64 [ 0, %.preheader54.us.preheader ], [ %indvars.iv.next70.us, %._crit_edge105.us ]
  %sunkaddr154 = shl i64 %indvars.iv69106.us, 3
  %sunkaddr155 = add i64 %sunkaddr, %sunkaddr154
  %sunkaddr156 = inttoptr i64 %sunkaddr155 to double*
  br label %.preheader53.us.us

._crit_edge105.us:                                ; preds = %._crit_edge101.us.us
  %indvars.iv.next70.us = add nuw nsw i64 %indvars.iv69106.us, 1
  %exitcond145 = icmp eq i64 %indvars.iv.next70.us, %3
  br i1 %exitcond145, label %.preheader.us.preheader, label %.preheader53.us.us.preheader

.preheader53.us.us:                               ; preds = %._crit_edge101.us.us, %.preheader53.us.us.preheader
  %indvars.iv65103.us.us = phi i64 [ 0, %.preheader53.us.us.preheader ], [ %indvars.iv.next66.us.us, %._crit_edge101.us.us ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65103.us.us, i64 %indvars.iv69106.us
  br i1 %36, label %.prol.loopexit142, label %41

; <label>:41:                                     ; preds = %.preheader53.us.us
  %42 = load double, double* %40, align 8
  %43 = load double, double* %sunkaddr156, align 8
  %44 = fmul double %42, %43
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv65103.us.us, i64 0
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  br label %.prol.loopexit142

.prol.loopexit142:                                ; preds = %.preheader53.us.us, %41
  %indvars.iv6199.us.us.unr.ph = phi i64 [ 1, %41 ], [ 0, %.preheader53.us.us ]
  br i1 %37, label %._crit_edge101.us.us, label %.preheader53.us.us.new.preheader

.preheader53.us.us.new.preheader:                 ; preds = %.prol.loopexit142
  br label %.preheader53.us.us.new

._crit_edge101.us.us.loopexit:                    ; preds = %.preheader53.us.us.new
  br label %._crit_edge101.us.us

._crit_edge101.us.us:                             ; preds = %._crit_edge101.us.us.loopexit, %.prol.loopexit142
  %indvars.iv.next66.us.us = add nuw nsw i64 %indvars.iv65103.us.us, 1
  %exitcond68.us.us = icmp eq i64 %indvars.iv.next66.us.us, %wide.trip.count73
  br i1 %exitcond68.us.us, label %._crit_edge105.us, label %.preheader53.us.us

.preheader53.us.us.new:                           ; preds = %.preheader53.us.us.new.preheader, %.preheader53.us.us.new
  %indvars.iv6199.us.us = phi i64 [ %indvars.iv.next62.us.us.1, %.preheader53.us.us.new ], [ %indvars.iv6199.us.us.unr.ph, %.preheader53.us.us.new.preheader ]
  %48 = load double, double* %40, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6199.us.us, i64 %indvars.iv69106.us
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv65103.us.us, i64 %indvars.iv6199.us.us
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next62.us.us = add nuw nsw i64 %indvars.iv6199.us.us, 1
  %55 = load double, double* %40, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next62.us.us, i64 %indvars.iv69106.us
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv65103.us.us, i64 %indvars.iv.next62.us.us
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next62.us.us.1 = add nuw nsw i64 %indvars.iv6199.us.us, 2
  %exitcond64.us.us.1 = icmp eq i64 %indvars.iv.next62.us.us.1, %wide.trip.count73
  br i1 %exitcond64.us.us.1, label %._crit_edge101.us.us.loopexit, label %.preheader53.us.us.new

.preheader.us.preheader:                          ; preds = %._crit_edge105.us
  %62 = add nsw i64 %wide.trip.count73, -1
  %xtraiter = and i64 %wide.trip.count73, 3
  %63 = icmp eq i64 %xtraiter, 0
  %64 = icmp ult i64 %62, 3
  %65 = bitcast i8* %22 to [2000 x [2000 x double]]*
  %66 = bitcast i8* %22 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5995.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next60.us, %._crit_edge.us ]
  br i1 %63, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv94.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv5995.us, i64 %indvars.iv94.us.prol
  %68 = bitcast double* %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5995.us, i64 %indvars.iv94.us.prol
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv94.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv94.us.unr = phi i64 [ 0, %.preheader.us ], [ %xtraiter, %.prol.loopexit.loopexit ]
  br i1 %64, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv94.us = phi i64 [ %indvars.iv.next.us.3, %.preheader.us.new ], [ %indvars.iv94.us.unr, %.preheader.us.new.preheader ]
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv5995.us, i64 %indvars.iv94.us
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5995.us, i64 %indvars.iv94.us
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv94.us, 1
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv5995.us, i64 %indvars.iv.next.us
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5995.us, i64 %indvars.iv.next.us
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv94.us, 2
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv5995.us, i64 %indvars.iv.next.us.1
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5995.us, i64 %indvars.iv.next.us.1
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv94.us, 3
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv5995.us, i64 %indvars.iv.next.us.2
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5995.us, i64 %indvars.iv.next.us.2
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv94.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %wide.trip.count73
  br i1 %exitcond.us.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next60.us = add nuw nsw i64 %indvars.iv5995.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next60.us, %3
  br i1 %exitcond, label %._crit_edge97.loopexit, label %.preheader.us

._crit_edge97.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge97

._crit_edge97:                                    ; preds = %._crit_edge97.loopexit, %._crit_edge135.thread
  %92 = phi i8* [ %5, %._crit_edge135.thread ], [ %22, %._crit_edge97.loopexit ]
  tail call void @free(i8* %92) #4
  ret void

._crit_edge124.us.3:                              ; preds = %._crit_edge124.us.3, %._crit_edge124.us.3.preheader.new
  %indvars.iv75125.us = phi i64 [ %indvars.iv75125.us.unr160, %._crit_edge124.us.3.preheader.new ], [ %indvars.iv.next76.us.3.1, %._crit_edge124.us.3 ]
  %93 = mul i64 %indvars.iv75125.us, 16000
  %scevgep = getelementptr i8, i8* %22, i64 %93
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %23, i32 8, i1 false)
  %94 = add i64 %93, 16000
  %scevgep.1 = getelementptr i8, i8* %22, i64 %94
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %23, i32 8, i1 false)
  %95 = add i64 %93, 32000
  %scevgep.2 = getelementptr i8, i8* %22, i64 %95
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %23, i32 8, i1 false)
  %96 = add i64 %93, 48000
  %scevgep.3 = getelementptr i8, i8* %22, i64 %96
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %23, i32 8, i1 false)
  %97 = mul i64 %indvars.iv75125.us, 16000
  %98 = add i64 %97, 64000
  %scevgep.1161 = getelementptr i8, i8* %22, i64 %98
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1161, i8 0, i64 %23, i32 8, i1 false)
  %99 = add i64 %97, 80000
  %scevgep.1.1 = getelementptr i8, i8* %22, i64 %99
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %23, i32 8, i1 false)
  %100 = add i64 %97, 96000
  %scevgep.2.1 = getelementptr i8, i8* %22, i64 %100
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %23, i32 8, i1 false)
  %101 = add i64 %97, 112000
  %scevgep.3.1 = getelementptr i8, i8* %22, i64 %101
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next76.us.3.1 = add nsw i64 %indvars.iv75125.us, 8
  %exitcond146.3.1 = icmp eq i64 %indvars.iv.next76.us.3.1, %3
  br i1 %exitcond146.3.1, label %.preheader54.us.preheader.loopexit.unr-lcssa, label %._crit_edge124.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = sext i32 %0 to i64
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader35.lr.ph, label %._crit_edge72

.preheader35.lr.ph:                               ; preds = %2
  %wide.trip.count53 = zext i32 %0 to i64
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge68, %.preheader35.lr.ph
  %indvars.iv5569 = phi i64 [ 0, %.preheader35.lr.ph ], [ %indvars.iv.next56, %._crit_edge68 ]
  %exitcond4359 = icmp eq i64 %indvars.iv5569, 0
  br i1 %exitcond4359, label %.preheader34, label %.preheader35..preheader33_crit_edge

.preheader35..preheader33_crit_edge:              ; preds = %.preheader35
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5569, i64 0
  br label %.preheader33

.preheader34.loopexit:                            ; preds = %._crit_edge
  br label %.preheader34

.preheader34:                                     ; preds = %.preheader34.loopexit, %.preheader35
  %5 = icmp eq i64 %indvars.iv5569, 0
  %exitcond5465 = icmp eq i64 %indvars.iv5569, %wide.trip.count53
  %or.cond = or i1 %exitcond5465, %5
  br i1 %or.cond, label %._crit_edge68, label %.preheader.lr.ph..preheader.us_crit_edge

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader34
  %xtraiter80 = and i64 %indvars.iv5569, 1
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5569, i64 0
  %7 = icmp eq i64 %xtraiter80, 0
  %8 = icmp eq i64 %indvars.iv5569, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge64.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv5166.us = phi i64 [ %indvars.iv5569, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next52.us, %._crit_edge64.us ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5569, i64 %indvars.iv5166.us
  %.pre75 = load double, double* %9, align 8
  br i1 %7, label %.prol.loopexit79, label %10

; <label>:10:                                     ; preds = %.preheader.us
  %11 = load double, double* %6, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv5166.us
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre75, %14
  store double %15, double* %9, align 8
  br label %.prol.loopexit79

.prol.loopexit79:                                 ; preds = %.preheader.us, %10
  %.unr82.ph = phi double [ %15, %10 ], [ %.pre75, %.preheader.us ]
  %indvars.iv4462.us.unr.ph = phi i64 [ 1, %10 ], [ 0, %.preheader.us ]
  br i1 %8, label %._crit_edge64.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit79
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %16 = phi double [ %28, %.preheader.us.new ], [ %.unr82.ph, %.preheader.us.new.preheader ]
  %indvars.iv4462.us = phi i64 [ %indvars.iv.next45.us.1, %.preheader.us.new ], [ %indvars.iv4462.us.unr.ph, %.preheader.us.new.preheader ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5569, i64 %indvars.iv4462.us
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4462.us, i64 %indvars.iv5166.us
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %9, align 8
  %indvars.iv.next45.us = add nuw nsw i64 %indvars.iv4462.us, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5569, i64 %indvars.iv.next45.us
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next45.us, i64 %indvars.iv5166.us
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %9, align 8
  %indvars.iv.next45.us.1 = add nuw nsw i64 %indvars.iv4462.us, 2
  %exitcond48.us.1 = icmp eq i64 %indvars.iv.next45.us.1, %indvars.iv5569
  br i1 %exitcond48.us.1, label %._crit_edge64.us.loopexit, label %.preheader.us.new

._crit_edge64.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge64.us

._crit_edge64.us:                                 ; preds = %._crit_edge64.us.loopexit, %.prol.loopexit79
  %indvars.iv.next52.us = add nuw nsw i64 %indvars.iv5166.us, 1
  %exitcond54.us = icmp eq i64 %indvars.iv.next52.us, %wide.trip.count53
  br i1 %exitcond54.us, label %._crit_edge68.loopexit, label %.preheader.us

.preheader33:                                     ; preds = %._crit_edge, %.preheader35..preheader33_crit_edge
  %indvars.iv3860 = phi i64 [ 0, %.preheader35..preheader33_crit_edge ], [ %indvars.iv.next39, %._crit_edge ]
  %exitcond57 = icmp eq i64 %indvars.iv3860, 0
  br i1 %exitcond57, label %.preheader33.._crit_edge_crit_edge, label %.lr.ph

.preheader33.._crit_edge_crit_edge:               ; preds = %.preheader33
  %.pre74 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5569, i64 %indvars.iv3860
  %.pre = load double, double* %29, align 8
  %xtraiter = and i64 %indvars.iv3860, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %30

; <label>:30:                                     ; preds = %.lr.ph
  %31 = load double, double* %.phi.trans.insert, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv3860
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %.pre, %34
  store double %35, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %30
  %.lcssa.unr.ph = phi double [ %35, %30 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %35, %30 ], [ %.pre, %.lr.ph ]
  %indvars.iv58.unr.ph = phi i64 [ 1, %30 ], [ 0, %.lr.ph ]
  %36 = icmp eq i64 %indvars.iv3860, 1
  br i1 %36, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %37 = phi double [ %49, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv58.unr.ph, %.lr.ph.new.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5569, i64 %indvars.iv58
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv3860
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fsub double %37, %42
  store double %43, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv58, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5569, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv3860
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv58, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv3860
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader33.._crit_edge_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader33.._crit_edge_crit_edge ], [ %29, %.prol.loopexit ], [ %29, %._crit_edge.loopexit ]
  %50 = phi double [ %.pre74, %.preheader33.._crit_edge_crit_edge ], [ %.lcssa.unr.ph, %.prol.loopexit ], [ %49, %._crit_edge.loopexit ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3860, i64 %indvars.iv3860
  %52 = load double, double* %51, align 8
  %53 = fdiv double %50, %52
  store double %53, double* %.pre-phi, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3860, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next39, %indvars.iv5569
  br i1 %exitcond43, label %.preheader34.loopexit, label %.preheader33

._crit_edge68.loopexit:                           ; preds = %._crit_edge64.us
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68.loopexit, %.preheader34
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv5569, 1
  %exitcond = icmp eq i64 %indvars.iv.next56, %3
  br i1 %exitcond, label %._crit_edge72.loopexit, label %.preheader35

._crit_edge72.loopexit:                           ; preds = %._crit_edge68
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge72.loopexit, %2
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
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv913.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10.us, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv913.us, %7
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv12.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv12.us, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge17
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge17, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv913.us, i64 %indvars.iv12.us
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge17

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv913.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next10.us, %7
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
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
