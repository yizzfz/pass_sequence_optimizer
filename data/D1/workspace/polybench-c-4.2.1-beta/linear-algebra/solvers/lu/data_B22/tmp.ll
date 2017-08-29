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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %._crit_edge.preheader.lr.ph, label %._crit_edge89.thread

._crit_edge89.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge62._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge58._crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv138 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next139, %._crit_edge58._crit_edge ]
  %indvars.iv136 = phi i64 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next137, %._crit_edge58._crit_edge ]
  %10 = sub i64 %7, %indvars.iv138
  %11 = shl i64 %10, 3
  br label %._crit_edge

._crit_edge58.preheader:                          ; preds = %._crit_edge
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %12 = icmp slt i64 %indvars.iv.next139, %8
  br i1 %12, label %._crit_edge58.preheader91, label %._crit_edge58._crit_edge

._crit_edge58.preheader91:                        ; preds = %._crit_edge58.preheader
  %13 = and i64 %11, 34359738360
  %14 = add nuw nsw i64 %13, 8
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv.next139
  %15 = mul nuw nsw i64 %indvars.iv138, 2000
  %scevgep134 = getelementptr double, double* %scevgep133, i64 %15
  %scevgep134135 = bitcast double* %scevgep134 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134135, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge58._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph84
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge ], [ 0, %.lr.ph84 ]
  %16 = sub nsw i64 0, %indvars.iv121
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv121
  store double %21, double* %22, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next122, %indvars.iv136
  br i1 %exitcond126, label %._crit_edge58.preheader, label %._crit_edge

._crit_edge58._crit_edge:                         ; preds = %._crit_edge58.preheader91, %._crit_edge58.preheader
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %23, align 8
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next139, %9
  br i1 %exitcond144, label %._crit_edge89, label %.lr.ph84

._crit_edge89:                                    ; preds = %._crit_edge58._crit_edge
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 true, label %._crit_edge59.preheader.us.preheader, label %._crit_edge89.._crit_edge62._crit_edge_crit_edge

._crit_edge89.._crit_edge62._crit_edge_crit_edge: ; preds = %._crit_edge89
  br label %._crit_edge62._crit_edge

._crit_edge59.preheader.us.preheader:             ; preds = %._crit_edge89
  %25 = add i32 %0, -1
  %26 = zext i32 %25 to i64
  %27 = shl nuw nsw i64 %26, 3
  %28 = add nuw nsw i64 %27, 8
  %xtraiter118 = and i32 %0, 3
  %lcmp.mod119 = icmp eq i32 %xtraiter118, 0
  br i1 %lcmp.mod119, label %._crit_edge59.preheader.us.prol.loopexit, label %._crit_edge59.preheader.us.prol.preheader

._crit_edge59.preheader.us.prol.preheader:        ; preds = %._crit_edge59.preheader.us.preheader
  %29 = add nsw i32 %xtraiter118, -1
  br label %._crit_edge59._crit_edge.us.prol

._crit_edge59._crit_edge.us.prol:                 ; preds = %._crit_edge59._crit_edge.us.prol, %._crit_edge59.preheader.us.prol.preheader
  %indvars.iv114.prol = phi i64 [ 0, %._crit_edge59.preheader.us.prol.preheader ], [ %indvars.iv.next115.prol, %._crit_edge59._crit_edge.us.prol ]
  %prol.iter120 = phi i32 [ %xtraiter118, %._crit_edge59.preheader.us.prol.preheader ], [ %prol.iter120.sub, %._crit_edge59._crit_edge.us.prol ]
  %30 = mul nuw nsw i64 %indvars.iv114.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next115.prol = add nuw nsw i64 %indvars.iv114.prol, 1
  %prol.iter120.sub = add nsw i32 %prol.iter120, -1
  %prol.iter120.cmp = icmp eq i32 %prol.iter120.sub, 0
  br i1 %prol.iter120.cmp, label %._crit_edge59.preheader.us.prol.loopexit.loopexit, label %._crit_edge59._crit_edge.us.prol, !llvm.loop !1

._crit_edge59.preheader.us.prol.loopexit.loopexit: ; preds = %._crit_edge59._crit_edge.us.prol
  %31 = zext i32 %29 to i64
  %32 = add nuw nsw i64 %31, 1
  br label %._crit_edge59.preheader.us.prol.loopexit

._crit_edge59.preheader.us.prol.loopexit:         ; preds = %._crit_edge59.preheader.us.preheader, %._crit_edge59.preheader.us.prol.loopexit.loopexit
  %indvars.iv114.unr = phi i64 [ 0, %._crit_edge59.preheader.us.preheader ], [ %32, %._crit_edge59.preheader.us.prol.loopexit.loopexit ]
  %33 = icmp ult i32 %25, 3
  br i1 %33, label %._crit_edge61.preheader.lr.ph, label %._crit_edge59._crit_edge.us.3.preheader

._crit_edge59._crit_edge.us.3.preheader:          ; preds = %._crit_edge59.preheader.us.prol.loopexit
  %34 = add nsw i64 %9, -4
  %35 = sub nsw i64 %34, %indvars.iv114.unr
  %36 = lshr i64 %35, 2
  %37 = and i64 %36, 1
  %lcmp.mod = icmp eq i64 %37, 0
  br i1 %lcmp.mod, label %._crit_edge59._crit_edge.us.3.prol.preheader, label %._crit_edge59._crit_edge.us.3.prol.loopexit

._crit_edge59._crit_edge.us.3.prol.preheader:     ; preds = %._crit_edge59._crit_edge.us.3.preheader
  %38 = mul nsw i64 %indvars.iv114.unr, 16000
  %scevgep.prol152 = getelementptr i8, i8* %24, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol152, i8 0, i64 %28, i32 8, i1 false)
  %39 = add i64 %38, 16000
  %scevgep.1.prol = getelementptr i8, i8* %24, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %28, i32 8, i1 false)
  %40 = add i64 %38, 32000
  %scevgep.2.prol = getelementptr i8, i8* %24, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %28, i32 8, i1 false)
  %41 = add i64 %38, 48000
  %scevgep.3.prol = getelementptr i8, i8* %24, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next115.3.prol = add nsw i64 %indvars.iv114.unr, 4
  br label %._crit_edge59._crit_edge.us.3.prol.loopexit

._crit_edge59._crit_edge.us.3.prol.loopexit:      ; preds = %._crit_edge59._crit_edge.us.3.prol.preheader, %._crit_edge59._crit_edge.us.3.preheader
  %indvars.iv114.unr153 = phi i64 [ %indvars.iv114.unr, %._crit_edge59._crit_edge.us.3.preheader ], [ %indvars.iv.next115.3.prol, %._crit_edge59._crit_edge.us.3.prol.preheader ]
  %42 = icmp eq i64 %36, 0
  br i1 %42, label %._crit_edge60.preheader, label %._crit_edge59._crit_edge.us.3.preheader.new

._crit_edge59._crit_edge.us.3.preheader.new:      ; preds = %._crit_edge59._crit_edge.us.3.prol.loopexit
  br label %._crit_edge59._crit_edge.us.3

._crit_edge60.preheader.unr-lcssa:                ; preds = %._crit_edge59._crit_edge.us.3
  br label %._crit_edge60.preheader

._crit_edge60.preheader:                          ; preds = %._crit_edge59._crit_edge.us.3.prol.loopexit, %._crit_edge60.preheader.unr-lcssa
  br i1 true, label %._crit_edge61.preheader.lr.ph, label %._crit_edge60.preheader.._crit_edge62._crit_edge_crit_edge

._crit_edge60.preheader.._crit_edge62._crit_edge_crit_edge: ; preds = %._crit_edge60.preheader
  br label %._crit_edge62._crit_edge

._crit_edge61.preheader.lr.ph:                    ; preds = %._crit_edge59.preheader.us.prol.loopexit, %._crit_edge60.preheader
  %xtraiter100 = and i32 %0, 1
  %43 = icmp eq i32 %xtraiter100, 0
  %44 = icmp eq i32 %0, 1
  %45 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %46 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %._crit_edge63.preheader.us.us.preheader

._crit_edge63.preheader.us.us.preheader:          ; preds = %._crit_edge61._crit_edge.us, %._crit_edge61.preheader.lr.ph
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge61._crit_edge.us ], [ 0, %._crit_edge61.preheader.lr.ph ]
  %sunkaddr147 = shl i64 %indvars.iv106, 3
  %sunkaddr148 = add i64 %sunkaddr, %sunkaddr147
  %sunkaddr149 = inttoptr i64 %sunkaddr148 to double*
  br label %._crit_edge63.preheader.us.us

._crit_edge61._crit_edge.us:                      ; preds = %._crit_edge63._crit_edge.us.us
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next107, %9
  br i1 %exitcond143, label %._crit_edge62.preheader, label %._crit_edge63.preheader.us.us.preheader

._crit_edge63.preheader.us.us:                    ; preds = %._crit_edge63._crit_edge.us.us, %._crit_edge63.preheader.us.us.preheader
  %indvars.iv102 = phi i64 [ 0, %._crit_edge63.preheader.us.us.preheader ], [ %indvars.iv.next103, %._crit_edge63._crit_edge.us.us ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv106
  br i1 %43, label %._crit_edge63.us.us.prol.loopexit, label %._crit_edge63.us.us.prol

._crit_edge63.us.us.prol:                         ; preds = %._crit_edge63.preheader.us.us
  %48 = load double, double* %47, align 8
  %49 = load double, double* %sunkaddr149, align 8
  %50 = fmul double %48, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv102, i64 0
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  br label %._crit_edge63.us.us.prol.loopexit

._crit_edge63.us.us.prol.loopexit:                ; preds = %._crit_edge63.preheader.us.us, %._crit_edge63.us.us.prol
  %indvars.iv96.unr.ph = phi i64 [ 1, %._crit_edge63.us.us.prol ], [ 0, %._crit_edge63.preheader.us.us ]
  br i1 %44, label %._crit_edge63._crit_edge.us.us, label %._crit_edge63.us.us.preheader

._crit_edge63.us.us.preheader:                    ; preds = %._crit_edge63.us.us.prol.loopexit
  br label %._crit_edge63.us.us

._crit_edge63._crit_edge.us.us.loopexit:          ; preds = %._crit_edge63.us.us
  br label %._crit_edge63._crit_edge.us.us

._crit_edge63._crit_edge.us.us:                   ; preds = %._crit_edge63._crit_edge.us.us.loopexit, %._crit_edge63.us.us.prol.loopexit
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond = icmp eq i64 %indvars.iv.next103, %9
  br i1 %exitcond, label %._crit_edge61._crit_edge.us, label %._crit_edge63.preheader.us.us

._crit_edge63.us.us:                              ; preds = %._crit_edge63.us.us.preheader, %._crit_edge63.us.us
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %._crit_edge63.us.us ], [ %indvars.iv96.unr.ph, %._crit_edge63.us.us.preheader ]
  %54 = load double, double* %47, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv106
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv102, i64 %indvars.iv96
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %58, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %61 = load double, double* %47, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next97, i64 %indvars.iv106
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next97
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %65, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, %9
  br i1 %exitcond99.1, label %._crit_edge63._crit_edge.us.us.loopexit, label %._crit_edge63.us.us

._crit_edge62.preheader:                          ; preds = %._crit_edge61._crit_edge.us
  br i1 true, label %._crit_edge64.preheader.us.preheader, label %._crit_edge62.preheader.._crit_edge62._crit_edge_crit_edge

._crit_edge62.preheader.._crit_edge62._crit_edge_crit_edge: ; preds = %._crit_edge62.preheader
  br label %._crit_edge62._crit_edge

._crit_edge64.preheader.us.preheader:             ; preds = %._crit_edge62.preheader
  %68 = add nsw i32 %xtraiter118, -1
  %69 = zext i32 %68 to i64
  %70 = add nuw nsw i64 %69, 1
  %71 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %72 = bitcast i8* %24 to [2000 x [2000 x double]]*
  br label %._crit_edge64.preheader.us

._crit_edge64.preheader.us:                       ; preds = %._crit_edge64._crit_edge.us, %._crit_edge64.preheader.us.preheader
  %indvars.iv93 = phi i64 [ 0, %._crit_edge64.preheader.us.preheader ], [ %indvars.iv.next94, %._crit_edge64._crit_edge.us ]
  br i1 %lcmp.mod119, label %._crit_edge64.us.prol.loopexit, label %._crit_edge64.us.prol.preheader

._crit_edge64.us.prol.preheader:                  ; preds = %._crit_edge64.preheader.us
  br label %._crit_edge64.us.prol

._crit_edge64.us.prol:                            ; preds = %._crit_edge64.us.prol.preheader, %._crit_edge64.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge64.us.prol ], [ 0, %._crit_edge64.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge64.us.prol ], [ %xtraiter118, %._crit_edge64.us.prol.preheader ]
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv93, i64 %indvars.iv.prol
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.prol
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge64.us.prol.loopexit.loopexit, label %._crit_edge64.us.prol, !llvm.loop !3

._crit_edge64.us.prol.loopexit.loopexit:          ; preds = %._crit_edge64.us.prol
  br label %._crit_edge64.us.prol.loopexit

._crit_edge64.us.prol.loopexit:                   ; preds = %._crit_edge64.us.prol.loopexit.loopexit, %._crit_edge64.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %._crit_edge64.preheader.us ], [ %70, %._crit_edge64.us.prol.loopexit.loopexit ]
  br i1 %33, label %._crit_edge64._crit_edge.us, label %._crit_edge64.us.preheader

._crit_edge64.us.preheader:                       ; preds = %._crit_edge64.us.prol.loopexit
  br label %._crit_edge64.us

._crit_edge64.us:                                 ; preds = %._crit_edge64.us.preheader, %._crit_edge64.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge64.us ], [ %indvars.iv.unr, %._crit_edge64.us.preheader ]
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %79 = bitcast double* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv
  %82 = bitcast double* %81 to i64*
  store i64 %80, i64* %82, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %84 = bitcast double* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next
  %87 = bitcast double* %86 to i64*
  store i64 %85, i64* %87, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %9
  br i1 %exitcond.3, label %._crit_edge64._crit_edge.us.loopexit, label %._crit_edge64.us

._crit_edge64._crit_edge.us.loopexit:             ; preds = %._crit_edge64.us
  br label %._crit_edge64._crit_edge.us

._crit_edge64._crit_edge.us:                      ; preds = %._crit_edge64._crit_edge.us.loopexit, %._crit_edge64.us.prol.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next94, %9
  br i1 %exitcond142, label %._crit_edge62._crit_edge.loopexit, label %._crit_edge64.preheader.us

._crit_edge62._crit_edge.loopexit:                ; preds = %._crit_edge64._crit_edge.us
  br label %._crit_edge62._crit_edge

._crit_edge62._crit_edge:                         ; preds = %._crit_edge62.preheader.._crit_edge62._crit_edge_crit_edge, %._crit_edge60.preheader.._crit_edge62._crit_edge_crit_edge, %._crit_edge89.._crit_edge62._crit_edge_crit_edge, %._crit_edge62._crit_edge.loopexit, %._crit_edge89.thread
  %98 = phi i8* [ undef, %._crit_edge62.preheader.._crit_edge62._crit_edge_crit_edge ], [ undef, %._crit_edge60.preheader.._crit_edge62._crit_edge_crit_edge ], [ undef, %._crit_edge89.._crit_edge62._crit_edge_crit_edge ], [ %4, %._crit_edge89.thread ], [ %24, %._crit_edge62._crit_edge.loopexit ]
  tail call void @free(i8* %98) #4
  ret void

._crit_edge59._crit_edge.us.3:                    ; preds = %._crit_edge59._crit_edge.us.3, %._crit_edge59._crit_edge.us.3.preheader.new
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr153, %._crit_edge59._crit_edge.us.3.preheader.new ], [ %indvars.iv.next115.3.1, %._crit_edge59._crit_edge.us.3 ]
  %99 = mul i64 %indvars.iv114, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %99
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %28, i32 8, i1 false)
  %100 = add i64 %99, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %100
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %28, i32 8, i1 false)
  %101 = add i64 %99, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %101
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %28, i32 8, i1 false)
  %102 = add i64 %99, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %102
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next115.3 = add nsw i64 %indvars.iv114, 4
  %103 = mul i64 %indvars.iv.next115.3, 16000
  %scevgep.1154 = getelementptr i8, i8* %24, i64 %103
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1154, i8 0, i64 %28, i32 8, i1 false)
  %104 = add i64 %103, 16000
  %scevgep.1.1 = getelementptr i8, i8* %24, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %28, i32 8, i1 false)
  %105 = add i64 %103, 32000
  %scevgep.2.1 = getelementptr i8, i8* %24, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %28, i32 8, i1 false)
  %106 = add i64 %103, 48000
  %scevgep.3.1 = getelementptr i8, i8* %24, i64 %106
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next115.3.1 = add nsw i64 %indvars.iv114, 8
  %exitcond117.3.1 = icmp eq i64 %indvars.iv.next115.3.1, %9
  br i1 %exitcond117.3.1, label %._crit_edge60.preheader.unr-lcssa, label %._crit_edge59._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %._crit_edge.preheader.preheader, label %._crit_edge45

._crit_edge.preheader.preheader:                  ; preds = %2
  %4 = zext i32 %0 to i64
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge35._crit_edge, %._crit_edge.preheader.preheader
  %indvars.iv77 = phi i64 [ 0, %._crit_edge.preheader.preheader ], [ %indvars.iv.next78, %._crit_edge35._crit_edge ]
  %5 = add nuw i64 %indvars.iv77, 4294967295
  %6 = icmp sgt i64 %indvars.iv77, 0
  br i1 %6, label %._crit_edge34.preheader.preheader, label %._crit_edge35._crit_edge

._crit_edge34.preheader.preheader:                ; preds = %._crit_edge.preheader
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 0
  br label %._crit_edge34.preheader

._crit_edge36.preheader.lr.ph:                    ; preds = %._crit_edge
  br i1 true, label %._crit_edge36.preheader.us.preheader, label %._crit_edge36.preheader.lr.ph.._crit_edge35._crit_edge_crit_edge

._crit_edge36.preheader.lr.ph.._crit_edge35._crit_edge_crit_edge: ; preds = %._crit_edge36.preheader.lr.ph
  br label %._crit_edge35._crit_edge

._crit_edge36.preheader.us.preheader:             ; preds = %._crit_edge36.preheader.lr.ph
  %xtraiter6683 = and i64 %indvars.iv77, 1
  %8 = trunc i64 %5 to i32
  %9 = icmp eq i64 %xtraiter6683, 0
  %10 = icmp eq i32 %8, 0
  br label %._crit_edge36.preheader.us

._crit_edge36.preheader.us:                       ; preds = %._crit_edge36.preheader.us.preheader, %._crit_edge36._crit_edge.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge36._crit_edge.us ], [ %indvars.iv77, %._crit_edge36.preheader.us.preheader ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv71
  %.pre49 = load double, double* %11, align 8
  br i1 %9, label %._crit_edge36.us.prol.loopexit, label %._crit_edge36.us.prol

._crit_edge36.us.prol:                            ; preds = %._crit_edge36.preheader.us
  %12 = load double, double* %7, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv71
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %.pre49, %15
  store double %16, double* %11, align 8
  br label %._crit_edge36.us.prol.loopexit

._crit_edge36.us.prol.loopexit:                   ; preds = %._crit_edge36.preheader.us, %._crit_edge36.us.prol
  %indvars.iv61.unr.ph = phi i64 [ 1, %._crit_edge36.us.prol ], [ 0, %._crit_edge36.preheader.us ]
  %.unr68.ph = phi double [ %16, %._crit_edge36.us.prol ], [ %.pre49, %._crit_edge36.preheader.us ]
  br i1 %10, label %._crit_edge36._crit_edge.us, label %._crit_edge36.us.preheader

._crit_edge36.us.preheader:                       ; preds = %._crit_edge36.us.prol.loopexit
  br label %._crit_edge36.us

._crit_edge36.us:                                 ; preds = %._crit_edge36.us.preheader, %._crit_edge36.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %._crit_edge36.us ], [ %indvars.iv61.unr.ph, %._crit_edge36.us.preheader ]
  %17 = phi double [ %29, %._crit_edge36.us ], [ %.unr68.ph, %._crit_edge36.us.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv61
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv71
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %11, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv.next62
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next62, i64 %indvars.iv71
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %11, align 8
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next62.1, %indvars.iv77
  br i1 %exitcond65.1, label %._crit_edge36._crit_edge.us.loopexit, label %._crit_edge36.us

._crit_edge36._crit_edge.us.loopexit:             ; preds = %._crit_edge36.us
  br label %._crit_edge36._crit_edge.us

._crit_edge36._crit_edge.us:                      ; preds = %._crit_edge36._crit_edge.us.loopexit, %._crit_edge36.us.prol.loopexit
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next72, %4
  br i1 %exitcond81, label %._crit_edge35._crit_edge.loopexit, label %._crit_edge36.preheader.us

._crit_edge34.preheader:                          ; preds = %._crit_edge34.preheader.preheader, %._crit_edge
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge ], [ 0, %._crit_edge34.preheader.preheader ]
  %30 = add nuw i64 %indvars.iv55, 4294967295
  %31 = icmp sgt i64 %indvars.iv55, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv55
  %.pre = load double, double* %32, align 8
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge34.preheader
  %xtraiter84 = and i64 %indvars.iv55, 1
  %lcmp.mod = icmp eq i64 %xtraiter84, 0
  br i1 %lcmp.mod, label %._crit_edge34.prol.loopexit, label %._crit_edge34.prol

._crit_edge34.prol:                               ; preds = %.lr.ph
  %33 = load double, double* %7, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv55
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fsub double %.pre, %36
  store double %37, double* %32, align 8
  br label %._crit_edge34.prol.loopexit

._crit_edge34.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge34.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge34.prol ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %37, %._crit_edge34.prol ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %37, %._crit_edge34.prol ], [ undef, %.lr.ph ]
  %38 = trunc i64 %30 to i32
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %._crit_edge, label %._crit_edge34.preheader87

._crit_edge34.preheader87:                        ; preds = %._crit_edge34.prol.loopexit
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.preheader87, %._crit_edge34
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge34 ], [ %indvars.iv.unr.ph, %._crit_edge34.preheader87 ]
  %40 = phi double [ %52, %._crit_edge34 ], [ %.unr.ph, %._crit_edge34.preheader87 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv55
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %40, %45
  store double %46, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv55
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  store double %52, double* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv55
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %._crit_edge34

._crit_edge.loopexit:                             ; preds = %._crit_edge34
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge34.preheader, %._crit_edge34.prol.loopexit
  %53 = phi double [ %.lcssa.unr.ph, %._crit_edge34.prol.loopexit ], [ %.pre, %._crit_edge34.preheader ], [ %52, %._crit_edge.loopexit ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv55
  %55 = load double, double* %54, align 8
  %56 = fdiv double %53, %55
  store double %56, double* %32, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond = icmp eq i64 %indvars.iv.next56, %indvars.iv77
  br i1 %exitcond, label %._crit_edge36.preheader.lr.ph, label %._crit_edge34.preheader

._crit_edge35._crit_edge.loopexit:                ; preds = %._crit_edge36._crit_edge.us
  br label %._crit_edge35._crit_edge

._crit_edge35._crit_edge:                         ; preds = %._crit_edge36.preheader.lr.ph.._crit_edge35._crit_edge_crit_edge, %._crit_edge35._crit_edge.loopexit, %._crit_edge.preheader
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next78, %4
  br i1 %exitcond82, label %._crit_edge45.loopexit, label %._crit_edge.preheader

._crit_edge45.loopexit:                           ; preds = %._crit_edge35._crit_edge
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %2
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
  br i1 %7, label %._crit_edge.preheader.us.preheader, label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge._crit_edge.us ]
  %10 = mul nsw i64 %indvars.iv13, %8
  br label %11

; <label>:11:                                     ; preds = %._crit_edge10.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %12 = add nsw i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge10.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %16, %11
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond17, label %._crit_edge._crit_edge.us, label %11

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge10.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %9
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
