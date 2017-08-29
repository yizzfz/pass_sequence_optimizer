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
  br i1 %3, label %.preheader14.lr.ph, label %._crit_edge40.thread

._crit_edge40.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge17

.preheader14.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count91 = zext i32 %0 to i64
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge38..lr.ph36_crit_edge, %.preheader14.lr.ph
  %indvars.iv89 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next90, %._crit_edge38..lr.ph36_crit_edge ]
  %indvars.iv87 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next88, %._crit_edge38..lr.ph36_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv89, 2001
  %10 = add nuw nsw i64 %9, 1
  %scevgep85 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  %11 = sub i64 %7, %indvars.iv89
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  %14 = add nuw nsw i64 %13, 8
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %15 = icmp slt i64 %indvars.iv.next90, %8
  br i1 %15, label %._crit_edge38.loopexit, label %._crit_edge38

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv73 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next74, %._crit_edge ]
  %16 = sub nsw i64 0, %indvars.iv73
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv73
  store double %21, double* %22, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next74, %indvars.iv87
  br i1 %exitcond78, label %.preheader13, label %._crit_edge

._crit_edge38.loopexit:                           ; preds = %.preheader13
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8586, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %.preheader13, %._crit_edge38.loopexit
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv89
  store double 1.000000e+00, double* %23, align 8
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %._crit_edge40, label %._crit_edge38..lr.ph36_crit_edge

._crit_edge38..lr.ph36_crit_edge:                 ; preds = %._crit_edge38
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  br label %.lr.ph36

._crit_edge40:                                    ; preds = %._crit_edge38
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %25 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %.preheader12.us.preheader, label %._crit_edge17

.preheader12.us.preheader:                        ; preds = %._crit_edge40
  %27 = add i32 %0, -1
  %28 = zext i32 %27 to i64
  %29 = shl nuw nsw i64 %28, 3
  %30 = add nuw nsw i64 %29, 8
  %xtraiter70 = and i32 %0, 3
  %lcmp.mod71 = icmp eq i32 %xtraiter70, 0
  br i1 %lcmp.mod71, label %.preheader12.us.prol.loopexit, label %._crit_edge33.us.prol.preheader

._crit_edge33.us.prol.preheader:                  ; preds = %.preheader12.us.preheader
  br label %._crit_edge33.us.prol

._crit_edge33.us.prol:                            ; preds = %._crit_edge33.us.prol.preheader, %._crit_edge33.us.prol
  %indvars.iv66.prol = phi i64 [ %indvars.iv.next67.prol, %._crit_edge33.us.prol ], [ 0, %._crit_edge33.us.prol.preheader ]
  %prol.iter72 = phi i32 [ %prol.iter72.sub, %._crit_edge33.us.prol ], [ %xtraiter70, %._crit_edge33.us.prol.preheader ]
  %31 = mul nuw nsw i64 %indvars.iv66.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next67.prol = add nuw nsw i64 %indvars.iv66.prol, 1
  %prol.iter72.sub = add i32 %prol.iter72, -1
  %prol.iter72.cmp = icmp eq i32 %prol.iter72.sub, 0
  br i1 %prol.iter72.cmp, label %.preheader12.us.prol.loopexit.loopexit, label %._crit_edge33.us.prol, !llvm.loop !1

.preheader12.us.prol.loopexit.loopexit:           ; preds = %._crit_edge33.us.prol
  br label %.preheader12.us.prol.loopexit

.preheader12.us.prol.loopexit:                    ; preds = %.preheader12.us.prol.loopexit.loopexit, %.preheader12.us.preheader
  %indvars.iv66.unr = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next67.prol, %.preheader12.us.prol.loopexit.loopexit ]
  %32 = icmp ult i32 %27, 3
  br i1 %32, label %.preheader10.lr.ph, label %._crit_edge33.us.3.preheader

._crit_edge33.us.3.preheader:                     ; preds = %.preheader12.us.prol.loopexit
  %wide.trip.count68.3 = zext i32 %0 to i64
  %33 = add nsw i64 %wide.trip.count68.3, -4
  %34 = sub i64 %33, %indvars.iv66.unr
  %35 = lshr i64 %34, 2
  %36 = and i64 %35, 1
  %lcmp.mod98 = icmp eq i64 %36, 0
  br i1 %lcmp.mod98, label %._crit_edge33.us.3.prol.preheader, label %._crit_edge33.us.3.prol.loopexit

._crit_edge33.us.3.prol.preheader:                ; preds = %._crit_edge33.us.3.preheader
  br label %._crit_edge33.us.3.prol

._crit_edge33.us.3.prol:                          ; preds = %._crit_edge33.us.3.prol.preheader
  %37 = mul nuw nsw i64 %indvars.iv66.unr, 16000
  %scevgep.prol100 = getelementptr i8, i8* %24, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol100, i8 0, i64 %30, i32 8, i1 false)
  %38 = mul i64 %indvars.iv66.unr, 16000
  %39 = add i64 %38, 16000
  %scevgep.1.prol = getelementptr i8, i8* %24, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %30, i32 8, i1 false)
  %40 = mul i64 %indvars.iv66.unr, 16000
  %41 = add i64 %40, 32000
  %scevgep.2.prol = getelementptr i8, i8* %24, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %30, i32 8, i1 false)
  %42 = mul i64 %indvars.iv66.unr, 16000
  %43 = add i64 %42, 48000
  %scevgep.3.prol = getelementptr i8, i8* %24, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next67.3.prol = add nsw i64 %indvars.iv66.unr, 4
  br label %._crit_edge33.us.3.prol.loopexit

._crit_edge33.us.3.prol.loopexit:                 ; preds = %._crit_edge33.us.3.prol, %._crit_edge33.us.3.preheader
  %indvars.iv66.unr101 = phi i64 [ %indvars.iv66.unr, %._crit_edge33.us.3.preheader ], [ %indvars.iv.next67.3.prol, %._crit_edge33.us.3.prol ]
  %44 = icmp eq i64 %35, 0
  br i1 %44, label %.preheader11, label %._crit_edge33.us.3.preheader.new

._crit_edge33.us.3.preheader.new:                 ; preds = %._crit_edge33.us.3.prol.loopexit
  br label %._crit_edge33.us.3

.preheader11.unr-lcssa:                           ; preds = %._crit_edge33.us.3
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge33.us.3.prol.loopexit, %.preheader11.unr-lcssa
  %45 = icmp sgt i32 %0, 0
  br i1 %45, label %.preheader10.lr.ph, label %._crit_edge17

.preheader10.lr.ph:                               ; preds = %.preheader11, %.preheader12.us.prol.loopexit
  %xtraiter52 = and i32 %0, 1
  %lcmp.mod53 = icmp eq i32 %xtraiter52, 0
  %46 = icmp eq i32 %0, 1
  %wide.trip.count56 = zext i32 %0 to i64
  %wide.trip.count48.1 = zext i32 %0 to i64
  %wide.trip.count60 = zext i32 %0 to i64
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %._crit_edge22.us, %.preheader10.lr.ph
  %indvars.iv58 = phi i64 [ 0, %.preheader10.lr.ph ], [ %indvars.iv.next59, %._crit_edge22.us ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv58
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %.preheader8, label %.preheader9.us.us.preheader

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv54 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next55, %._crit_edge20.us.us ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv58
  br i1 %lcmp.mod53, label %.prol.loopexit51, label %.prol.preheader50

.prol.preheader50:                                ; preds = %.preheader9.us.us
  %49 = load double, double* %48, align 8
  %50 = load double, double* %47, align 8
  %51 = fmul double %49, %50
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv54, i64 0
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  br label %.prol.loopexit51

.prol.loopexit51:                                 ; preds = %.preheader9.us.us, %.prol.preheader50
  %indvars.iv46.unr.ph = phi i64 [ 1, %.prol.preheader50 ], [ 0, %.preheader9.us.us ]
  br i1 %46, label %._crit_edge20.us.us, label %.preheader9.us.us.new.preheader

.preheader9.us.us.new.preheader:                  ; preds = %.prol.loopexit51
  br label %.preheader9.us.us.new

._crit_edge20.us.us.loopexit:                     ; preds = %.preheader9.us.us.new
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %.prol.loopexit51
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %._crit_edge22.us, label %.preheader9.us.us

.preheader9.us.us.new:                            ; preds = %.preheader9.us.us.new.preheader, %.preheader9.us.us.new
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %.preheader9.us.us.new ], [ %indvars.iv46.unr.ph, %.preheader9.us.us.new.preheader ]
  %55 = load double, double* %48, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv58
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv54, i64 %indvars.iv46
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %62 = load double, double* %48, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next47, i64 %indvars.iv58
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv54, i64 %indvars.iv.next47
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next47.1, %wide.trip.count48.1
  br i1 %exitcond49.1, label %._crit_edge20.us.us.loopexit, label %.preheader9.us.us.new

.preheader8:                                      ; preds = %._crit_edge22.us
  %69 = icmp sgt i32 %0, 0
  br i1 %69, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader8
  %70 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %71 = icmp ult i32 %70, 3
  %wide.trip.count45 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next44, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv43, i64 %indvars.iv.prol
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.prol
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %71, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv43, i64 %indvars.iv
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %93 = bitcast double* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader8, %.preheader11, %._crit_edge40, %._crit_edge40.thread
  %97 = phi i8* [ %4, %._crit_edge40.thread ], [ %24, %._crit_edge40 ], [ %24, %.preheader11 ], [ %24, %.preheader8 ], [ %24, %._crit_edge17.loopexit ]
  tail call void @free(i8* %97) #4
  ret void

._crit_edge33.us.3:                               ; preds = %._crit_edge33.us.3, %._crit_edge33.us.3.preheader.new
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr101, %._crit_edge33.us.3.preheader.new ], [ %indvars.iv.next67.3.1, %._crit_edge33.us.3 ]
  %98 = mul nuw nsw i64 %indvars.iv66, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %98
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %30, i32 8, i1 false)
  %99 = mul i64 %indvars.iv66, 16000
  %100 = add i64 %99, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %100
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %30, i32 8, i1 false)
  %101 = mul i64 %indvars.iv66, 16000
  %102 = add i64 %101, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %102
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %30, i32 8, i1 false)
  %103 = mul i64 %indvars.iv66, 16000
  %104 = add i64 %103, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next67.3 = add nsw i64 %indvars.iv66, 4
  %105 = mul nuw nsw i64 %indvars.iv.next67.3, 16000
  %scevgep.1102 = getelementptr i8, i8* %24, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1102, i8 0, i64 %30, i32 8, i1 false)
  %106 = mul i64 %indvars.iv.next67.3, 16000
  %107 = add i64 %106, 16000
  %scevgep.1.1 = getelementptr i8, i8* %24, i64 %107
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %30, i32 8, i1 false)
  %108 = mul i64 %indvars.iv.next67.3, 16000
  %109 = add i64 %108, 32000
  %scevgep.2.1 = getelementptr i8, i8* %24, i64 %109
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %30, i32 8, i1 false)
  %110 = mul i64 %indvars.iv.next67.3, 16000
  %111 = add i64 %110, 48000
  %scevgep.3.1 = getelementptr i8, i8* %24, i64 %111
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next67.3.1 = add nsw i64 %indvars.iv66, 8
  %exitcond69.3.1 = icmp eq i64 %indvars.iv.next67.3.1, %wide.trip.count68.3
  br i1 %exitcond69.3.1, label %.preheader11.unr-lcssa, label %._crit_edge33.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader6.preheader, label %._crit_edge17

.preheader6.preheader:                            ; preds = %2
  %wide.trip.count48 = zext i32 %0 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge13, %.preheader6.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader6.preheader ], [ %indvars.iv.next47, %._crit_edge13 ]
  %4 = add i64 %indvars.iv46, 4294967295
  %5 = icmp sgt i64 %indvars.iv46, 0
  br i1 %5, label %.preheader4.preheader, label %._crit_edge13

.preheader4.preheader:                            ; preds = %.preheader6
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 0
  br label %.preheader4

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %7 = icmp sgt i64 %indvars.iv46, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter3650 = and i64 %indvars.iv46, 1
  %lcmp.mod37 = icmp eq i64 %xtraiter3650, 0
  %8 = trunc i64 %4 to i32
  %9 = icmp eq i32 %8, 0
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv46, %.preheader.us.preheader ], [ %indvars.iv.next41, %._crit_edge11.us ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv40
  br i1 %lcmp.mod37, label %.prol.loopexit35, label %.prol.preheader34

.prol.preheader34:                                ; preds = %.preheader.us
  %12 = load double, double* %10, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv40
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = load double, double* %11, align 8
  %17 = fsub double %16, %15
  store double %17, double* %11, align 8
  br label %.prol.loopexit35

.prol.loopexit35:                                 ; preds = %.preheader.us, %.prol.preheader34
  %indvars.iv29.unr.ph = phi i64 [ 1, %.prol.preheader34 ], [ 0, %.preheader.us ]
  br i1 %9, label %._crit_edge11.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit35
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader.us.new ], [ %indvars.iv29.unr.ph, %.preheader.us.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv29
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv29, i64 %indvars.iv40
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = load double, double* %11, align 8
  %24 = fsub double %23, %22
  store double %24, double* %11, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next30
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next30, i64 %indvars.iv40
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = load double, double* %11, align 8
  %31 = fsub double %30, %29
  store double %31, double* %11, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next30.1, %indvars.iv46
  br i1 %exitcond33.1, label %._crit_edge11.us.loopexit, label %.preheader.us.new

._crit_edge11.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.prol.loopexit35
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge13.loopexit, label %.preheader.us

.preheader4:                                      ; preds = %._crit_edge, %.preheader4.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next24, %._crit_edge ]
  %32 = add i64 %indvars.iv23, 4294967295
  %33 = icmp sgt i64 %indvars.iv23, 0
  br i1 %33, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader4
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv23
  %xtraiter51 = and i64 %indvars.iv23, 1
  %lcmp.mod = icmp eq i64 %xtraiter51, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %35 = load double, double* %6, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv23
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = load double, double* %34, align 8
  %40 = fsub double %39, %38
  store double %40, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %41 = trunc i64 %32 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv23
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %34, align 8
  %49 = fsub double %48, %47
  store double %49, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv23
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %34, align 8
  %56 = fsub double %55, %54
  store double %56, double* %34, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv23
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader4
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv23
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv23
  %60 = load double, double* %59, align 8
  %61 = fdiv double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, %indvars.iv46
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader4

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader.lr.ph, %.preheader6
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge17.loopexit, label %.preheader6

._crit_edge17.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
