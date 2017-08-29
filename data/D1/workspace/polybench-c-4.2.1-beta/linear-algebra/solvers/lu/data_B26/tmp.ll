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
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader56.lr.ph, label %._crit_edge84.thread

._crit_edge84.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge59

.preheader56.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.lr.ph78

.lr.ph78:                                         ; preds = %._crit_edge82, %.preheader56.lr.ph
  %indvars.iv134 = phi i64 [ 0, %.preheader56.lr.ph ], [ %12, %._crit_edge82 ]
  %indvars.iv132 = phi i64 [ 1, %.preheader56.lr.ph ], [ %indvars.iv.next133, %._crit_edge82 ]
  %10 = sub i64 %7, %indvars.iv134
  %11 = shl i64 %10, 3
  br label %._crit_edge

.preheader55:                                     ; preds = %._crit_edge
  %12 = add nuw nsw i64 %indvars.iv134, 1
  %13 = icmp slt i64 %12, %8
  br i1 %13, label %.lr.ph81.preheader, label %._crit_edge82

.lr.ph81.preheader:                               ; preds = %.preheader55
  %14 = and i64 %11, 34359738360
  %15 = add nuw nsw i64 %14, 8
  %scevgep129 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %12
  %16 = mul nuw nsw i64 %indvars.iv134, 2000
  %scevgep130 = getelementptr double, double* %scevgep129, i64 %16
  %scevgep130131 = bitcast double* %scevgep130 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep130131, i8 0, i64 %15, i32 8, i1 false)
  br label %._crit_edge82

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph78
  %indvars.iv117 = phi i64 [ 0, %.lr.ph78 ], [ %indvars.iv.next118, %._crit_edge ]
  %17 = sub nsw i64 0, %indvars.iv117
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, %0
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %5
  %22 = fadd double %21, 1.000000e+00
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv117
  store double %22, double* %23, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next118, %indvars.iv132
  br i1 %exitcond122, label %.preheader55, label %._crit_edge

._crit_edge82:                                    ; preds = %.preheader55, %.lr.ph81.preheader
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv134
  store double 1.000000e+00, double* %24, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond140 = icmp eq i64 %12, %9
  br i1 %exitcond140, label %.preheader54.us.preheader, label %.lr.ph78

.preheader54.us.preheader:                        ; preds = %._crit_edge82
  %25 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %26 = add i32 %0, -1
  %27 = zext i32 %26 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = add nuw nsw i64 %28, 8
  %xtraiter114 = and i32 %0, 3
  %lcmp.mod115 = icmp eq i32 %xtraiter114, 0
  br i1 %lcmp.mod115, label %.preheader54.us.prol.loopexit, label %.preheader54.us.prol.preheader

.preheader54.us.prol.preheader:                   ; preds = %.preheader54.us.preheader
  %30 = add nsw i32 %xtraiter114, -1
  br label %._crit_edge75.us.prol

._crit_edge75.us.prol:                            ; preds = %._crit_edge75.us.prol, %.preheader54.us.prol.preheader
  %indvars.iv110.prol = phi i64 [ 0, %.preheader54.us.prol.preheader ], [ %indvars.iv.next111.prol, %._crit_edge75.us.prol ]
  %prol.iter116 = phi i32 [ %xtraiter114, %.preheader54.us.prol.preheader ], [ %prol.iter116.sub, %._crit_edge75.us.prol ]
  %31 = mul nuw nsw i64 %indvars.iv110.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %25, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next111.prol = add nuw nsw i64 %indvars.iv110.prol, 1
  %prol.iter116.sub = add nsw i32 %prol.iter116, -1
  %prol.iter116.cmp = icmp eq i32 %prol.iter116.sub, 0
  br i1 %prol.iter116.cmp, label %.preheader54.us.prol.loopexit.loopexit, label %._crit_edge75.us.prol, !llvm.loop !1

.preheader54.us.prol.loopexit.loopexit:           ; preds = %._crit_edge75.us.prol
  %32 = zext i32 %30 to i64
  %33 = add nuw nsw i64 %32, 1
  br label %.preheader54.us.prol.loopexit

.preheader54.us.prol.loopexit:                    ; preds = %.preheader54.us.preheader, %.preheader54.us.prol.loopexit.loopexit
  %indvars.iv110.unr = phi i64 [ %33, %.preheader54.us.prol.loopexit.loopexit ], [ 0, %.preheader54.us.preheader ]
  %34 = icmp ult i32 %26, 3
  br i1 %34, label %.preheader52.lr.ph, label %._crit_edge75.us.3.preheader

._crit_edge75.us.3.preheader:                     ; preds = %.preheader54.us.prol.loopexit
  %35 = add nsw i64 %9, -4
  %36 = sub nsw i64 %35, %indvars.iv110.unr
  %37 = lshr i64 %36, 2
  %38 = and i64 %37, 1
  %lcmp.mod = icmp eq i64 %38, 0
  br i1 %lcmp.mod, label %._crit_edge75.us.3.prol.preheader, label %._crit_edge75.us.3.prol.loopexit

._crit_edge75.us.3.prol.preheader:                ; preds = %._crit_edge75.us.3.preheader
  br label %._crit_edge75.us.3.prol

._crit_edge75.us.3.prol:                          ; preds = %._crit_edge75.us.3.prol.preheader
  %39 = mul nsw i64 %indvars.iv110.unr, 16000
  %scevgep.prol147 = getelementptr i8, i8* %25, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol147, i8 0, i64 %29, i32 8, i1 false)
  %40 = add i64 %39, 16000
  %scevgep.1.prol = getelementptr i8, i8* %25, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %29, i32 8, i1 false)
  %41 = add i64 %39, 32000
  %scevgep.2.prol = getelementptr i8, i8* %25, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %29, i32 8, i1 false)
  %42 = add i64 %39, 48000
  %scevgep.3.prol = getelementptr i8, i8* %25, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next111.3.prol = add nsw i64 %indvars.iv110.unr, 4
  br label %._crit_edge75.us.3.prol.loopexit

._crit_edge75.us.3.prol.loopexit:                 ; preds = %._crit_edge75.us.3.prol, %._crit_edge75.us.3.preheader
  %indvars.iv110.unr148 = phi i64 [ %indvars.iv110.unr, %._crit_edge75.us.3.preheader ], [ %indvars.iv.next111.3.prol, %._crit_edge75.us.3.prol ]
  %43 = icmp eq i64 %37, 0
  br i1 %43, label %.preheader52.lr.ph.loopexit, label %._crit_edge75.us.3.preheader.new

._crit_edge75.us.3.preheader.new:                 ; preds = %._crit_edge75.us.3.prol.loopexit
  br label %._crit_edge75.us.3

.preheader52.lr.ph.loopexit.unr-lcssa:            ; preds = %._crit_edge75.us.3
  br label %.preheader52.lr.ph.loopexit

.preheader52.lr.ph.loopexit:                      ; preds = %._crit_edge75.us.3.prol.loopexit, %.preheader52.lr.ph.loopexit.unr-lcssa
  br label %.preheader52.lr.ph

.preheader52.lr.ph:                               ; preds = %.preheader52.lr.ph.loopexit, %.preheader54.us.prol.loopexit
  %xtraiter96 = and i32 %0, 1
  %44 = icmp eq i32 %xtraiter96, 0
  %45 = icmp eq i32 %0, 1
  %46 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader51.us.us.preheader

.preheader51.us.us.preheader:                     ; preds = %._crit_edge64.us, %.preheader52.lr.ph
  %indvars.iv102 = phi i64 [ 0, %.preheader52.lr.ph ], [ %indvars.iv.next103, %._crit_edge64.us ]
  %sunkaddr143 = shl i64 %indvars.iv102, 3
  %sunkaddr144 = add i64 %sunkaddr, %sunkaddr143
  %sunkaddr145 = inttoptr i64 %sunkaddr144 to double*
  br label %.preheader51.us.us

._crit_edge64.us:                                 ; preds = %._crit_edge62.us.us
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond139 = icmp eq i64 %indvars.iv.next103, %9
  br i1 %exitcond139, label %.preheader.us.preheader, label %.preheader51.us.us.preheader

.preheader51.us.us:                               ; preds = %._crit_edge62.us.us, %.preheader51.us.us.preheader
  %indvars.iv98 = phi i64 [ 0, %.preheader51.us.us.preheader ], [ %indvars.iv.next99, %._crit_edge62.us.us ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv102
  br i1 %44, label %.prol.loopexit95, label %49

; <label>:49:                                     ; preds = %.preheader51.us.us
  %50 = load double, double* %48, align 8
  %51 = load double, double* %sunkaddr145, align 8
  %52 = fmul double %50, %51
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv98, i64 0
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %53, align 8
  br label %.prol.loopexit95

.prol.loopexit95:                                 ; preds = %.preheader51.us.us, %49
  %indvars.iv90.unr.ph = phi i64 [ 1, %49 ], [ 0, %.preheader51.us.us ]
  br i1 %45, label %._crit_edge62.us.us, label %.preheader51.us.us.new.preheader

.preheader51.us.us.new.preheader:                 ; preds = %.prol.loopexit95
  br label %.preheader51.us.us.new

._crit_edge62.us.us.loopexit:                     ; preds = %.preheader51.us.us.new
  br label %._crit_edge62.us.us

._crit_edge62.us.us:                              ; preds = %._crit_edge62.us.us.loopexit, %.prol.loopexit95
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond = icmp eq i64 %indvars.iv.next99, %9
  br i1 %exitcond, label %._crit_edge64.us, label %.preheader51.us.us

.preheader51.us.us.new:                           ; preds = %.preheader51.us.us.new.preheader, %.preheader51.us.us.new
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.preheader51.us.us.new ], [ %indvars.iv90.unr.ph, %.preheader51.us.us.new.preheader ]
  %56 = load double, double* %48, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv102
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv98, i64 %indvars.iv90
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %63 = load double, double* %48, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next91, i64 %indvars.iv102
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv98, i64 %indvars.iv.next91
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next91.1 = add nuw nsw i64 %indvars.iv90, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next91.1, %9
  br i1 %exitcond93.1, label %._crit_edge62.us.us.loopexit, label %.preheader51.us.us.new

.preheader.us.preheader:                          ; preds = %._crit_edge64.us
  %70 = add nsw i32 %xtraiter114, -1
  %71 = zext i32 %70 to i64
  %72 = add nuw nsw i64 %71, 1
  %73 = icmp eq i32 %xtraiter114, 0
  %74 = icmp ult i32 %26, 3
  %75 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %76 = bitcast i8* %25 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv87 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next88, %._crit_edge.us ]
  br i1 %73, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter114, %.prol.preheader.preheader ]
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv87, i64 %indvars.iv.prol
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv.prol
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %72, %.prol.loopexit.loopexit ]
  br i1 %74, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv87, i64 %indvars.iv
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv.next
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %93 = bitcast double* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.2
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv.next.2
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %9
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next88, %9
  br i1 %exitcond138, label %._crit_edge59.loopexit, label %.preheader.us

._crit_edge59.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %._crit_edge84.thread
  %102 = phi i8* [ %4, %._crit_edge84.thread ], [ %25, %._crit_edge59.loopexit ]
  tail call void @free(i8* %102) #4
  ret void

._crit_edge75.us.3:                               ; preds = %._crit_edge75.us.3, %._crit_edge75.us.3.preheader.new
  %indvars.iv110 = phi i64 [ %indvars.iv110.unr148, %._crit_edge75.us.3.preheader.new ], [ %indvars.iv.next111.3.1, %._crit_edge75.us.3 ]
  %103 = mul i64 %indvars.iv110, 16000
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
  %107 = mul i64 %indvars.iv110, 16000
  %108 = add i64 %107, 64000
  %scevgep.1149 = getelementptr i8, i8* %25, i64 %108
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1149, i8 0, i64 %29, i32 8, i1 false)
  %109 = add i64 %107, 80000
  %scevgep.1.1 = getelementptr i8, i8* %25, i64 %109
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %29, i32 8, i1 false)
  %110 = add i64 %107, 96000
  %scevgep.2.1 = getelementptr i8, i8* %25, i64 %110
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %29, i32 8, i1 false)
  %111 = add i64 %107, 112000
  %scevgep.3.1 = getelementptr i8, i8* %25, i64 %111
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next111.3.1 = add nsw i64 %indvars.iv110, 8
  %exitcond113.3.1 = icmp eq i64 %indvars.iv.next111.3.1, %9
  br i1 %exitcond113.3.1, label %.preheader52.lr.ph.loopexit.unr-lcssa, label %._crit_edge75.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader34.preheader, label %._crit_edge45

.preheader34.preheader:                           ; preds = %2
  %4 = zext i32 %0 to i64
  br label %.preheader34

.preheader34:                                     ; preds = %._crit_edge41, %.preheader34.preheader
  %indvars.iv79 = phi i64 [ 0, %.preheader34.preheader ], [ %indvars.iv.next80, %._crit_edge41 ]
  %5 = add nuw i64 %indvars.iv79, 4294967295
  %6 = icmp sgt i64 %indvars.iv79, 0
  br i1 %6, label %.preheader32.preheader, label %._crit_edge41

.preheader32.preheader:                           ; preds = %.preheader34
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 0
  br label %.preheader32

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter6885 = and i64 %indvars.iv79, 1
  %8 = trunc i64 %5 to i32
  %9 = icmp eq i64 %xtraiter6885, 0
  %10 = icmp eq i32 %8, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge39.us, %.preheader.us.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv79, %.preheader.us.preheader ], [ %indvars.iv.next74, %._crit_edge39.us ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 %indvars.iv73
  %.pre49 = load double, double* %11, align 8
  br i1 %9, label %.prol.loopexit67, label %12

; <label>:12:                                     ; preds = %.preheader.us
  %13 = load double, double* %7, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv73
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %.pre49, %16
  store double %17, double* %11, align 8
  br label %.prol.loopexit67

.prol.loopexit67:                                 ; preds = %.preheader.us, %12
  %indvars.iv61.unr.ph = phi i64 [ 1, %12 ], [ 0, %.preheader.us ]
  %.unr70.ph = phi double [ %17, %12 ], [ %.pre49, %.preheader.us ]
  br i1 %10, label %._crit_edge39.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit67
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %.preheader.us.new ], [ %indvars.iv61.unr.ph, %.preheader.us.new.preheader ]
  %18 = phi double [ %30, %.preheader.us.new ], [ %.unr70.ph, %.preheader.us.new.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 %indvars.iv61
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv73
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %11, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 %indvars.iv.next62
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next62, i64 %indvars.iv73
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %11, align 8
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next62.1, %indvars.iv79
  br i1 %exitcond65.1, label %._crit_edge39.us.loopexit, label %.preheader.us.new

._crit_edge39.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us.loopexit, %.prol.loopexit67
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next74, %4
  br i1 %exitcond83, label %._crit_edge41.loopexit, label %.preheader.us

.preheader32:                                     ; preds = %._crit_edge, %.preheader32.preheader
  %indvars.iv55 = phi i64 [ 0, %.preheader32.preheader ], [ %indvars.iv.next56, %._crit_edge ]
  %31 = add nuw i64 %indvars.iv55, 4294967295
  %32 = icmp sgt i64 %indvars.iv55, 0
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 %indvars.iv55
  %.pre = load double, double* %33, align 8
  br i1 %32, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader32
  %xtraiter86 = and i64 %indvars.iv55, 1
  %lcmp.mod = icmp eq i64 %xtraiter86, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %34

; <label>:34:                                     ; preds = %.lr.ph
  %35 = load double, double* %7, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv55
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %.pre, %38
  store double %39, double* %33, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %34
  %indvars.iv.unr.ph = phi i64 [ 1, %34 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %39, %34 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %39, %34 ], [ undef, %.lr.ph ]
  %40 = trunc i64 %31 to i32
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %42 = phi double [ %54, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv55
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv55
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  store double %54, double* %33, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv55
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader32
  %55 = phi double [ %.pre, %.preheader32 ], [ %.lcssa.unr.ph, %.prol.loopexit ], [ %54, %._crit_edge.loopexit ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv55
  %57 = load double, double* %56, align 8
  %58 = fdiv double %55, %57
  store double %58, double* %33, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond = icmp eq i64 %indvars.iv.next56, %indvars.iv79
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader32

._crit_edge41.loopexit:                           ; preds = %._crit_edge39.us
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %.preheader34
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next80, %4
  br i1 %exitcond84, label %._crit_edge45.loopexit, label %.preheader34

._crit_edge45.loopexit:                           ; preds = %._crit_edge41
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
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge10

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %10 = mul nsw i64 %indvars.iv11, %8
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %11 = add nsw i64 %indvars.iv, %10
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %._crit_edge16
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge16, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond15, label %._crit_edge.us, label %._crit_edge16

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %9
  br i1 %exitcond, label %._crit_edge10.loopexit, label %.preheader.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %2
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
